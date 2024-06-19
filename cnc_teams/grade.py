#!/usr/bin/env python2.7
# vim: tabstop=4 shiftwidth=4 softtabstop=4

import sys
import os
import subprocess
import time

debug = True

def try_compile(source):
    """ Accepts source file name, tries to figure out what it is and compile
    it. Returns the executable command for running the compiled (or not
    compiled) program and potentially a filename to cleanup
    """
    sourcepath = source.split('/')
    (basename, extension) = sourcepath[-1].rpartition(".")[::2]

    comp = None
    output = None
    executable = source

    if extension == "cpp":
        comp = "g++ -o %s %s" % (basename, source)
        executable = "./%s" % basename
        output = basename

    elif extension == "c":
        comp = "gcc -o %s %s" % (basename, source)
        executable = "./%s" % basename
        output = basename

    if extension == "f":
        comp = "gfortran -ffree-form -o %s %s" % (basename, source)
        executable = "./%s" % basename
        output = basename

    elif extension == "java":
        comp = "cp %s . ; javac %s.java" % (source, basename)
        executable = "/usr/bin/java %s" % basename
        output = "%s.class" % basename

    elif extension == "cs":
        comp = "cp %s . ; gmcs %s.cs" % (source, basename)
        executable = "/usr/bin/mono %s.exe" % basename
        output = "%s.exe" % basename

    elif extension == "frink":
        executable = "/bin/bash /opt/crashandcompile/grader/frink %s" % source

    elif extension == "hs":
        comp = "ghc -o %s %s" % (basename, source)
        executable = "./%s" % basename
        output = basename

    elif extension == "py":
        # read the head of the file to try and guess python version
        with open(source) as myfile:
            head=myfile.readlines(1)
        if "python2.7" in head[0]:
            executable = "/usr/bin/python2.7 %s" % source
        else:
            executable = "python %s" % source

    elif extension == "lisp":
        executable = "clisp %s" % source

    elif extension == "scm":
        executable = "guile %s" % source

    elif extension == "go":
        executable = "go run %s" % source

    elif extension == "rb":
        executable = "ruby %s" % source

    elif extension == "pl":
        executable = "perl %s" % source

    elif extension == "php":
        executable = "php %s" % source

    elif extension == "lua":
        executable = "lua %s" % source

    else:
        # assume interpreted
        comp = "chmod u+x %s" % source
        if len(sourcepath) < 2:
            executable = "./%s" % source

    # if we have a compile command, run it
    if comp:
        comp_cmd = subprocess.Popen(comp, shell=True, stdout=subprocess.PIPE,
                                    stderr=subprocess.PIPE)
        if comp_cmd.wait():
            print "Compilation failed"
            (out, err) = comp_cmd.communicate()
            print out
            print err
            sys.exit(1)

    return executable, output


def main(source, input_file, output_file=None):
    # TODO: take submissions with a makefile
    # TODO: take submissions as a tarball
    # TODO: run tests in a chroot

    executable, output = try_compile(source)

    # Run the test program
    print executable
    exec_cmd = subprocess.Popen(executable, stdout=subprocess.PIPE,
                                stderr=subprocess.PIPE, shell=True,
                                stdin=open(input_file))
    # 60-second time limit
    ret = exec_cmd.poll()
    i = 0
    while i < 45 and ret == None:
        i += 1
        ret = exec_cmd.poll()
        time.sleep(1)

    result = 0

    if ret == None:
        # timeout. kill process and fail
        exec_cmd.kill()
        print "Execution timed out"
        ret = exec_cmd.poll()
        while ret == None:
           exec_cmd.send_signal(9)
           time.sleep(1)
           ret = exec_cmd.poll()
        result = 2
    elif ret:
        # program execution failed
        print "Program execution failed with return code %d"%ret
        result = 3
    else:
        if output_file:
            (out, err) = exec_cmd.communicate()
            diff_cmd = subprocess.Popen("diff -wBb - %s"%output_file,
                    stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                    stdin=subprocess.PIPE, shell=True)
            (diff_out, diff_err) = diff_cmd.communicate(out)
            ret = diff_cmd.wait()
            if ret:
                print "%s failed test"%source
                if debug:
                    print diff_out
                result = 3
            else:
                print "%s passed"%source
        else:
            print "%s passed"%source

    if output:
        os.remove(output)

    sys.exit(result)

if __name__ == '__main__':
    if len(sys.argv) < 3 or len(sys.argv) > 4:
        print "Usage: grade.py <source> <input> [output]"

    main(*sys.argv[1:])

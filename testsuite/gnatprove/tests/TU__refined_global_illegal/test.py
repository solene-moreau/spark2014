from test_support import gcc, prove_all

gcc("refined_global_illegal.adb", opt=["-c", "-gnatf"])
prove_all(opt=["-u", "refined_global_illegal_2.adb", "-cargs", "-gnatf"])

from test_support import *
prove_all(no_fail=True, prover=["z3", "cvc4"])
# Alt-ergo consumes gigabytes of memory, but doesn't prove any VC here

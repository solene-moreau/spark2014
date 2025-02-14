from test_support import prove_all

contains_manual_proof = False


def replay():
    prove_all(
        prover=["cvc5", "altergo", "z3"], no_fail=True, procs=0, steps=0, vc_timeout=240
    )


if __name__ == "__main__":
    prove_all(replay=True, no_fail=True)

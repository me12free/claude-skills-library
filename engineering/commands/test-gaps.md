Analyse the test suite for $ARGUMENTS and identify gaps.

Steps:
1. Read all existing test files for the target
2. Read all source files being tested
3. Map each source function/endpoint to its test coverage

Produce:

**Coverage map**
| Source file:function | Test file:test | Status |
|----------------------|----------------|--------|
| | | COVERED / PARTIAL / MISSING |

**Priority gaps**
List uncovered paths in order of risk:
- Auth paths with no test
- Money-moving operations with no idempotency test
- Error handling paths with no test
- State transition edge cases with no test

**Recommended tests**
For each gap marked MISSING or PARTIAL, write the test stub:

```python
def test_{{name}}():
    # Arrange
    # Act
    # Assert
```

Do not write passing tests that test nothing. Each stub must assert a specific behaviour.
After listing stubs, ask which ones to implement first.

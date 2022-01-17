# Integration tests


### 1, [test-01.tfvars](test-01.tfvars)

Creating teams and membership in an empty GitHub organization


### 2, [test-02.tfvars](test-01.tfvars)

Same as [test-01.tfvars](test-01.tfvars), but with a much larger list of teams to be created and `-parallelism` set to 50. This is being checked in order to check for potential race-conditions with the currently used provider.

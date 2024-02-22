import os
import pytest
from tftest import TerraformTest


@pytest.fixture(scope='module')
def tf_test():
    fixtures_dir = os.path.join(os.path.dirname(__file__), 'fixtures/github_repos')
    print(f"Fixtures Directory: {fixtures_dir}")
    tf = TerraformTest(tfdir=fixtures_dir)
    tf.setup(cleanup_on_exit=True)
    yield tf


def test_variables_presence(tf_test):
    plan = tf_test.plan(output=True)
    expected_variables = {
        'name': 'github_token',
        'description': 'Required by the GitHub Terraform provider',
        'visibility': 'private',
    }

    for var_name, expected_value in expected_variables.items():
        assert var_name in plan.variables, f"Variable '{var_name}' not found in plan."
        assert plan.variables[var_name] == expected_value, f"Variable '{var_name}' does not have the expected value '{expected_value}'."


def test_module_plan(tf_test):
    plan = tf_test.plan(output=True)
    print(f"Outputs: {plan.outputs}")
    print(f"Variables: {plan.variables}")
    assert False
    # assert 'module.module-test-repo.github_repository.default' in plan.resources
    # expected_teams = [
    #     'operations_engineering_test',
    #     'test_team_access',
    #     'test_team_one',
    #     'test_team_two'
    #     ]
    # for team in expected_teams:
    #     assert f'data.github_team.{team}' in plan.data

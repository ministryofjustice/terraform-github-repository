import os
import pytest
from tftest import TerraformTest


@pytest.fixture
def plan():
    fixtures_dir = os.path.join(os.path.dirname(__file__), 'fixtures/github_repos')
    tf = TerraformTest(tfdir=fixtures_dir)
    tf.setup(cleanup_on_exit=True)
    return tf.plan(output=True)


def test_variables(plan):
    assert 'github_token' in plan.variables


def test_terraform_outputs(plan):
    outputs = plan.outputs

    assert outputs['admin_permission'] == 'admin', \
        "Admin permission should be 'admin'"
    assert outputs['admin_repository'] == 'module-test-repo', \
        "Admin repository should be 'module-test-repo'"
    assert outputs['branch_protection_pattern'] == 'main', \
        "Branch protection pattern should be 'main'"
    assert outputs['description'] == \
        'This repository was created by the terraform github repository unit test • This repository is defined and managed in Terraform', \
        "Description value mismatch"
    assert outputs['homepage_url'] == \
        'https://github.com/ministryofjustice/terraform-github-repository', \
        "Homepage URL should match"
    assert outputs['maintain_permission'] == 'maintain', \
        "Maintain permission should be 'maintain'"
    assert outputs['maintain_repository'] == 'module-test-repo', \
        "Maintain repository should be 'module-test-repo'"
    assert outputs['name'] == 'module-test-repo', \
        "Repository name should be 'module-test-repo'"
    assert outputs['pull_permission'] == 'pull', \
        "Pull permission should be 'pull'"
    assert outputs['pull_repository'] == 'module-test-repo', \
        "Pull repository should be 'module-test-repo'"
    assert outputs['push_permission'] == 'push', \
        "Push permission should be 'push'"
    assert outputs['push_repository'] == 'module-test-repo', \
        "Push repository should be 'module-test-repo'"
    assert outputs['tag_protection_pattern'] == '*', \
        "Tag protection pattern should be '*'"
    assert outputs['test_actions_variable_value'] == 'test', \
        "Test actions variable value should be 'test'"
    assert outputs['visibility'] == 'public', \
        "Visibility should be 'public'"

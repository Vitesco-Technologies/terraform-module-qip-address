all: fmt docs init test

fmt:
	terraform fmt -recursive

docs:
	rm -f .terraform.lock.hcl  # to avoid mentioning versions in README
	terraform-docs .

init:
	terraform init -upgrade
	rm -f .terraform.lock.hcl  # to avoid mentioning versions in README
	cd tests/simple && terraform init -upgrade
	cd tests/full && terraform init -upgrade

test:
	terraform validate
	cd tests/simple && terraform validate
	cd tests/full && terraform validate

clean:
	rm -f .terraform.lock.hcl tests/*/.terraform.lock.hcl
	rm -rf .terraform tests/*/.terraform

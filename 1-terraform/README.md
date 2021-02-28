# USAGE

## 1. Define variables

* Powershell

Create a pm_credentials.ps1 and execute it :

```powershell
$env:PM_API_URL="https://<node_ip>:8006/api2/json"
$env:PM_USER="<api_user>"
$env:PM_PASS="<password>"
```

* Shell

Create a pm_credentials.sh and execute it :

```shell
export PM_API_URL="https://<node_ip>:8006/api2/json"
export PM_USER="<api_user>"
export PM_PASS="<password>"
```

## 2. Edit terraform config

* Fill the sshkeys var with your public ssh keys into the `main.tf` file

* Check that the other parameters in the `main.tf` file match your needs

## 3. Use terraform

```shell
terraform init
terraform plan
terraform apply
```

# Troubleshooting

## Logging

* Powershell

```powershell
$env:TF_LOG="TRACE" # enable log
$env:TF_LOG="" # disable log
```

* Shell

```shell
export TF_LOG="TRACE" # enable log
export TF_LOG="" # disable log
```
terraform {
  required_version = ">= 1.1.9"
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 0.2.1"
    }
    azurerm = {
      version = ">= 3.5.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  alias           = "dev"
  subscription_id = module.secret_azdo.values["DEV-SUBSCRIPTION-ID"].value
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  alias           = "uat"
  subscription_id = module.secret_azdo.values["UAT-SUBSCRIPTION-ID"].value
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
  alias           = "prod"
  subscription_id = module.secret_azdo.values["PROD-SUBSCRIPTION-ID"].value
}

# Chevereto-Free DigitalOcean Marketplace

![Chevereto](LOGO.svg)

This repository provides the Chevereto-Free [DigitalOcean Marketplace](https://marketplace.digitalocean.com/apps/chevereto-free) application.

## Instructions

Install [Packer](https://learn.hashicorp.com/tutorials/packer/get-started-install-cli):

```sh
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install packer
```

Provide [DigitalOcean's PAT](https://docs.digitalocean.com/reference/api/create-personal-access-token/):

```sh
export DIGITALOCEAN_API_TOKEN=token_here
```

Run:

```sh
git clone https://github.com/rodber/chevereto-free-digitalocean
cd chevereto-free-digitalocean/
packer build marketplace-image.json
```

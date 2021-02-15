module "k3s-cluster" {
  source = "./modules/k3s-cluster"
  name_prefix = "k3s-node"
  mac_addresses = [
    "e6:7f:34:cd:1f:ec",
    "28:ec:2a:c1:1b:f3",
    "46:6b:47:8f:56:75",
    "46:6b:47:8f:56:76"
  ]
  ssh_user = "terraform"
  sshkeys = <<EOF
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDLOnpmcBaAFyIDmuNMmmRdWgwHHQZQyTC/JaxT2uNah3rW12FD4rmqFSS6/KhZqnDKHQ2KBG4RPjdCKIhzw6/DD/n1Bp2DWdHa/jt82hhU8Kq/zdipieVGMx2yjxsq0YqE/hXjw/Uxs/sVkAYct379vpjz7vi1Vg7dHhFp1A8NNIVZkPRxMHF3h1v7SVsNiRoi072JzXpkmHQfU9jJiOjuH3ddl2AOaBJX/obDwoIXFFJyUVoWLXqMLIwo7tHhy6c0Xvs2nx6QrXHZV3uhqLSt5VdGlK99jxGYEQkJYb7JBOlS+20XJiJV3E9Kb236P3zhU11CEJDvkVeCATOYwv0XsSTxIoIyJByRKpNo6ZvU/alEh7utMGG35w7KwCiTElr8ww2WkkxsJQcywJQYWN5XsL8CxmAtlUWC/D4Scqg4gpip9QmushuYwmHENoPOvtkX1z5zoDbNx8ZlBarbPKPD7AGBTFZ8uey1tgFjIhu9zZHw7+rtYlib66XeyTZUzjk= loicbtd@loicbtd-pc
EOF
  bridge = "vmbr0"
  storage_size = "32G"
  storage_pool = "data0"
  target_node = "node0"
  cores = 2
  memory = 2048
  template_name = "ubuntu-20.04-cloudinit"
}

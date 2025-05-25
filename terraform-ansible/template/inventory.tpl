[child]
%{ for ip in child_ips ~}
${ip} ansible_user=ubuntu ansible_ssh_private_key_file=${key_path}
%{ endfor ~}

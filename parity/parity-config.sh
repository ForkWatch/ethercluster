kubectl create secret generic parity-config --namespace mainnet \
--from-file=config.toml=parity-mn/secret/config.toml
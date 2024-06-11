for port in range(1, 65536):
  if port == 80: continue
  print(
f"""[[services]]
  protocol = 'tcp'
  internal_port = {port}

  [[services.ports]]
    port = {port}
"""
)

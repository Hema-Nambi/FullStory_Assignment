import base64

def decode_pwd(encry):
    decoded_pwd = base64.b64decode(encry)
    pwd = decoded_pwd.decode("utf-8")
    return pwd
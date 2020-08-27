import os

def save(obj):
    obj.pop('_state', None)
    obj.pop('id_image', None)

    file_name = str(obj['nit']) + '-' + str(obj['id']) + '.txt'
    file_path = ''

    with open(file_name, 'w') as f:
        for key, value in obj.items():
            f.write(key + ": " + str(value) + "\n")
    file_path = os.path.abspath(file_name)

    return file_path

import pathlib
import sys
import shutil

script = pathlib.Path(__file__)
src = script.parents[0]

dest = pathlib.Path.home() / ".config" / "waybar"

device = sys.argv[1]

exclude = [script.name]
exclude.append('config_laptop' if device.lower() == 'desktop' else 'config_desktop')

for file in src.glob('*'):
    if file.name in exclude:
        continue

    if file.name.startswith('config_'):
        shutil.copy(file, dest / 'config')
        continue

    shutil.copy(file, dest / file.name)


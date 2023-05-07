import typer
import pathlib
import xml.etree.ElementTree as ET
from enum import Enum
from shutil import copy2
from typing import TextIO



class EnumPath(Enum):
    DISCORD_FOLDER = pathlib.Path("/Applications/Discord.app/Contents")
    INFO_PLIST = DISCORD_FOLDER / 'Info.plist'
    TEST_INFO_PLIST = DISCORD_FOLDER / 'Info.plist.test'
    DISCORD_PACKAGE = DISCORD_FOLDER / 'MacOS/Discord'
    FIXED_PACKAGE = DISCORD_FOLDER / 'MacOS/discord_'


def backupFile(file: pathlib.Path):

    fileOld = pathlib.Path(f'{file.resolve()}.old')
    copy2(file, fileOld)



def editPlist(text: str, plistPath: TextIO):
    """Modfies plist CFBundleExecutable to {key}"""
    import plistlib

    backupFile(plistPath)

    with open(plistPath, mode='rb') as fp:
        plist = plistlib.load(fp)
        
    plist['CFBundleExecutable'] = text

    with open(plistPath, mode='wb+') as fp:
        plistlib.dump(plist, fp)
    
    # i promise in the future i will first search google before implementing my shit code

    #root = plist.getroot()
    #found = False
    #for child in root.iter():

    #    if child.tag == 'key' and child.text == 'CFBundleExecutable':
    #        found = True
    #        continue

    #    if found:
    #        CFBValue = child
    #        break

    #    
    #CFBValue.text = text

    #plist.write(plistPath, encoding='utf-8', xml_declaration=True)
    

app = typer.Typer()

def acknowledgement():
    print("Solution by u/FriedEngineer and u/neoney")
    print("Orignal reddit post: https://www.reddit.com/r/hackintosh/comments/g6bwuu/discord_keeps_crashing_every_time_i_join_a_voice/")

@app.command()
def test():
    """Reserved for debug purposes"""
    pass
    #editPlist('hey', EnumPath.TEST_INFO_PLIST.value)

@app.command()
def install():
    """edits info.plist in discord package. Note: will make updates fail. this script is NOT protected against malicous info.plit (xml)"""
    from os import chmod

    acknowledgement()

    start_script = "MKL_DEBUG_CPU_TYPE=5 ./Discord"

    with open(EnumPath.FIXED_PACKAGE.value, "w") as fp:
        fp.write(start_script)
    chmod(EnumPath.FIXED_PACKAGE.value, 0o755)

    editPlist('_discord', EnumPath.INFO_PLIST.value)

    

    

@app.command()
def uninstall():
    """Remove amd hackintosh incompatibilty fixes for discord"""

    acknowledgement()

    editPlist('Discord', EnumPath.INFO_PLIST.value)

if __name__ == '__main__':
    app()

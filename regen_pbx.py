import os
from pathlib import Path
root = Path('SoundAmplifier')
project_dir = Path('SoundAmplifier.xcodeproj')
project_file = project_dir / 'project.pbxproj'
files = []
for p in sorted(root.rglob('*.swift')):
    files.append(p)
info_plist = root / 'Info.plist'

def rel_path(path: Path) -> str:
    return os.path.relpath(path, project_dir).replace('\\', '/')

def idhex(i):
    return f"{i:024X}"

next_id = 100000000000000000000000

def new_id():
    global next_id
    val = idhex(next_id)
    next_id += 1
    return val

file_refs = []
build_files = []
for p in files:
    fid = new_id()
    file_refs.append((fid, p))
    bf = new_id()
    build_files.append((bf, fid, p.name))
info_id = new_id()
app_id = new_id()
group_id = new_id()
products_group_id = new_id()
project_id = new_id()
target_id = new_id()
proj_cfg_list_id = new_id()
target_cfg_list_id = new_id()
def_cfg_id = new_id()
rel_cfg_id = new_id()
sources_phase_id = new_id()

entries = []
for fid, p in file_refs:
    rel = rel_path(p)
    entries.append(f"\t\t\t{fid} /* {p.name} */ = {{\n\t\t\t\tisa = PBXFileReference;\n\t\t\t\tlastKnownFileType = sourcecode.swift;\n\t\t\t\tpath = {rel};\n\t\t\t\tsourceTree = \"<group>\";\n\t\t\t}};\n")
entries.append(f"\t\t\t{info_id} /* Info.plist */ = {{\n\t\t\t\tisa = PBXFileReference;\n\t\t\t\tlastKnownFileType = text.plist.xml;\n\t\t\t\tpath = {rel_path(info_plist)};\n\t\t\t\tsourceTree = \"<group>\";\n\t\t\t}};\n")
entries.append(f"\t\t\t{app_id} /* SoundAmplifier.app */ = {{\n\t\t\t\tisa = PBXFileReference;\n\t\t\t\texplicitFileType = wrapper.application;\n\t\t\t\tpath = SoundAmplifier.app;\n\t\t\t\tsourceTree = BUILT_PRODUCTS_DIR;\n\t\t\t}};\n")

for bf, fid, name in build_files:
    entries.append(f"\t\t\t{bf} /* {name} */ = {{\n\t\t\t\tisa = PBXBuildFile;\n\t\t\t\tfileRef = {fid} /* {name} */;\n\t\t\t}};\n")

entries.append(f"\t\t\t{group_id} = {{\n\t\t\t\tisa = PBXGroup;\n\t\t\t\tchildren = (\n")
for fid, p in file_refs:
    entries.append(f"\t\t\t\t\t{fid} /* {p.name} */,\n")
entries.append(f"\t\t\t\t\t{info_id} /* Info.plist */,\n")
entries.append("\t\t\t\t);\n\t\t\t\tpath = \"\";\n\t\t\t\tsourceTree = \"<group>\";\n\t\t\t};\n")
entries.append(f"\t\t\t{products_group_id} = {{\n\t\t\t\tisa = PBXGroup;\n\t\t\t\tchildren = (\n\t\t\t\t\t{app_id} /* SoundAmplifier.app */,\n\t\t\t\t);\n\t\t\t\tname = Products;\n\t\t\t\tsourceTree = \"<group>\";\n\t\t\t}};\n")

entries.append(f"\t\t\t{sources_phase_id} = {{\n\t\t\t\tisa = PBXSourcesBuildPhase;\n\t\t\t\tbuildActionMask = 2147483647;\n\t\t\t\tfiles = (\n")
for bf, fid, name in build_files:
    entries.append(f"\t\t\t\t\t{bf} /* {name} */,\n")
entries.append("\t\t\t\t);\n\t\t\t\trunOnlyForDeploymentPostprocessing = 0;\n\t\t\t};\n")

entries.append("\t\t\t" + target_id + " = {\n")
entries.append("\t\t\t\tisa = PBXNativeTarget;\n")
entries.append("\t\t\t\tbuildConfigurationList = {} /* Build configuration list for Sound Amplifier */;\n".format(target_cfg_list_id))
entries.append("\t\t\t\tbuildPhases = (\n")
entries.append("\t\t\t\t\t{} /* Sources */,\n".format(sources_phase_id))
entries.append("\t\t\t\t);\n")
entries.append("\t\t\t\tbuildRules = (\n")
entries.append("\t\t\t\t);\n")
entries.append("\t\t\t\tdependencies = (\n")
entries.append("\t\t\t\t);\n")
entries.append("\t\t\t\tname = \"SoundAmplifier\";\n")
entries.append("\t\t\t\tproductName = \"SoundAmplifier\";\n")
entries.append("\t\t\t\tproductReference = {} /* SoundAmplifier.app */;\n".format(app_id))
entries.append("\t\t\t\tproductType = \"com.apple.product-type.application\";\n")
entries.append("\t\t\t};\n")

for cid, name in [(def_cfg_id, 'Debug'), (rel_cfg_id, 'Release')]:
    entries.append("\t\t\t" + cid + " = {\n")
    entries.append("\t\t\t\tisa = XCBuildConfiguration;\n")
    entries.append("\t\t\t\tbuildSettings = {\n")
    entries.append("\t\t\t\t\tINFOPLIST_FILE = {} ;\n".format(rel_path(info_plist)))
    entries.append("\t\t\t\t\tPRODUCT_NAME = \"SoundAmplifier\";\n")
    entries.append("\t\t\t\t\tPRODUCT_BUNDLE_IDENTIFIER = com.soundamplifier.app;\n")
    entries.append("\t\t\t\t\tSWIFT_VERSION = 5.9;\n")
    entries.append("\t\t\t\t\tIPHONEOS_DEPLOYMENT_TARGET = 15.0;\n")
    entries.append("\t\t\t\t\tCODE_SIGN_STYLE = Automatic;\n")
    entries.append("\t\t\t\t\tENABLE_BITCODE = NO;\n")
    entries.append("\t\t\t\t\tSWIFT_COMPILATION_MODE = wholemodule;\n")
    entries.append("\t\t\t\t\tGCC_OPTIMIZATION_LEVEL = 3;\n")
    entries.append("\t\t\t\t\tSWIFT_OPTIMIZATION_LEVEL = -Owholemodule;\n")
    entries.append("\t\t\t\t};\n")
    entries.append("\t\t\t\tname = {} ;\n".format(name))
    entries.append("\t\t\t};\n")

entries.append("\t\t\t" + proj_cfg_list_id + " = {\n")
entries.append("\t\t\t\tisa = XCConfigurationList;\n")
entries.append("\t\t\t\tbuildConfigurations = (\n")
entries.append("\t\t\t\t\t{} /* Debug */,\n".format(def_cfg_id))
entries.append("\t\t\t\t\t{} /* Release */,\n".format(rel_cfg_id))
entries.append("\t\t\t\t);\n")
entries.append("\t\t\t\tdefaultConfigurationIsVisible = 0;\n")
entries.append("\t\t\t\tdefaultConfigurationName = Release;\n")
entries.append("\t\t\t};\n")
entries.append("\t\t\t" + target_cfg_list_id + " = {\n")
entries.append("\t\t\t\tisa = XCConfigurationList;\n")
entries.append("\t\t\t\tbuildConfigurations = (\n")
entries.append("\t\t\t\t\t{} /* Debug */,\n".format(def_cfg_id))
entries.append("\t\t\t\t\t{} /* Release */,\n".format(rel_cfg_id))
entries.append("\t\t\t\t);\n")
entries.append("\t\t\t\tdefaultConfigurationIsVisible = 0;\n")
entries.append("\t\t\t\tdefaultConfigurationName = Release;\n")
entries.append("\t\t\t};\n")

entries.append("\t\t\t" + project_id + " = {\n")
entries.append("\t\t\t\tisa = PBXProject;\n")
entries.append("\t\t\t\tattributes = {\n")
entries.append("\t\t\t\t\tLastUpgradeCheck = 1430;\n")
entries.append("\t\t\t\t};\n")
entries.append("\t\t\t\tbuildConfigurationList = {} ;\n".format(proj_cfg_list_id))
entries.append("\t\t\t\tcompatibilityVersion = \"Xcode 15.0\";\n")
entries.append("\t\t\t\tdevelopmentRegion = en;\n")
entries.append("\t\t\t\thasScannedForEncodings = 0;\n")
entries.append("\t\t\t\tmainGroup = {} ;\n".format(group_id))
entries.append("\t\t\t\tproductRefGroup = {} ;\n".format(products_group_id))
entries.append("\t\t\t\tprojectDirPath = \"\";\n")
entries.append("\t\t\t\tprojectRoot = \"\";\n")
entries.append("\t\t\t\ttargets = (\n")
entries.append("\t\t\t\t\t{} ,\n".format(target_id))
entries.append("\t\t\t\t);\n")
entries.append("\t\t\t};\n")


proj_text = "// !$*UTF8*$!\n{\n\tarchiveVersion = 1;\n\tclasses = {\n\t};\n\tobjectVersion = 56;\n\tobjects = {\n" + ''.join(entries) + "\t};\n\trootObject = %s;\n}\n" % project_id
project_file.write_text(proj_text, encoding='utf-8')
print('Wrote project.pbxproj with', len(file_refs), 'source files')

import xml.etree.ElementTree as ET
import pandas as pd
import pprint

header = {}
list_section = []
file = 'CompareDoku.xml'

tree = ET.parse(file)
root = tree.getroot()

for child in root:
    if child.tag == 'Quelle1':
        source_1 = child.tag
    if child.tag == 'Quelle2':
        source_2 = child.tag


# print(source_1, source_2)

for child in root:
    temp_header = {}
    for index, i in enumerate(child):
        if i[0].text not in list_section:
            list_section.append(i[0].text)
        # print(index, i.tag, len(i))
        if len(i) > 0:
            for index_2, _ in enumerate(i):
                # print('\t', index_2, _.tag, len(_))
                if len(_) > 0:
                    for index_3, __ in enumerate(_):
                        # print('\t\t', index_3, __.tag, len(__))
                        if len(__) > 0:
                            for index_4, ___ in enumerate(__):
                                # print('\t\t\t', index_4, ___.tag, len(___))
                                if len(___) > 0:
                                    for index_5, ____ in enumerate(___):
                                        # print('\t\t\t\t', index_5, ____.tag, len(____))
                                        if len(____) > 0:
                                            for index_6, _____ in enumerate(____):
                                                # print('\t\t\t\t\t', index_6, _____.tag, len(_____))
                                                if len(_____) > 0:
                                                    for index_7, ______ in enumerate(_____):
                                                        # print('\t\t\t\t\t\t', index_7, ______.tag, len(______))
                                                        if len(______) > 0:
                                                            for index_8, _______ in enumerate(______):
                                                                # print('\t\t\t\t\t\t\t', index_8, _______.tag,
                                                                #       len(_______))
                                                                if index_8 == 1 and ______.tag == 'DokuColumn' and _____.tag == 'DokuCols' and i[0].text != 'Overview':
                                                                    # print('\t\t\t\t\t\t\tName:___', _______.text)
                                                                    temp_header.setdefault(_______.text, [])
        header[i[0].text] = temp_header

# print(temp_header)

header.pop('Overview')
pprint.pprint(header)
# print('list_section: ', list_section)

df = pd.DataFrame(header)

# df.set_axis(temp_header, axis=1)
#

print(df.head(4))

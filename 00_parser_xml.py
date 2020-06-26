import xml.etree.ElementTree as ET
# import pandas as pd
import pprint
import string

header = {}
list_section = []
file = 'CompareDoku.xml'
file = 'CompareDoku_2\CompareDoku_2.xml'

tree = ET.parse(file)
root = tree.getroot()

##print(root)

##find source_1 and source_2
source_dict = {}
for child in root:
    child_str = str(child.text)
    if child.tag == 'Quelle1':
        source_1 = child.tag
        source_1 = child_str.split('\\')[-1]
        source_dict['source_1'] = source_1
    if child.tag == 'Quelle2':
        source_2 = child.tag
        source_2 = child_str.split('\\')[-1]
        source_dict['source_2'] = source_2

##print(source_1, source_2)
pprint.pprint(source_dict)

for child in root:
    for index, i in enumerate(child):
        parameter_dict = {}
        ##        print(parameter_dict)
        if i[0].text not in list_section:
            ##            print(i[0].text)
            list_section.append(i[0].text)
        ##        print(index, i.tag, len(i))
        if len(i) > 0:
            for index_2, _ in enumerate(i):
                ##                print('\t', index_2, _.tag, len(_))
                if len(_) > 0:
                    for index_3, __ in enumerate(_):
                        ##                        print('\t\t', index_3, __.tag, len(__))
                        if len(__) > 0:
                            for index_4, ___ in enumerate(__):
                                ##                                print('\t\t\t', index_4, ___.tag, len(___))
                                if len(___) > 0:
                                    for index_5, ____ in enumerate(___):
                                        ##                                        print('\t\t\t\t', index_5, ____.tag, len(____))
                                        if len(____) > 0:
                                            for index_6, _____ in enumerate(____):
                                                ##                                                print('\t\t\t\t\t', index_6, _____.tag, len(_____))
                                                if len(_____) > 0:
                                                    for index_7, ______ in enumerate(_____):
                                                        ##                                                        print('\t\t\t\t\t\t', index_7, ______.tag, len(______))
                                                        if len(______) > 0:
                                                            for index_8, Items in enumerate(______):
                                                                ##                                                                print(Items.tag, Items.text)
                                                                if 0 < len(Items) <= 4 and Items[0].text == '<>' and \
                                                                        str(Items[1].text)[0] not in string.digits and \
                                                                        Items[1].text != 'Access attributes' and \
                                                                        Items[2].text != 'Range does not exist':
                                                                    parameter_dict.setdefault(Items[1].text, [])
                                                                    parameter_dict[Items[1].text].append(Items[2].text)
                                                                    parameter_dict[Items[1].text].append(Items[3].text)
                                                                elif len(Items) <= 5 and Items[0].text == '<>':
                                                                    print('ddddd')
        ##                                                                    print(Items[1].text, Items[2].text, Items[3].text)
        ##                                                                    print('\\'*10)

        header[i[0].text] = parameter_dict
##        print(parameter_dict.keys())
##        print('*'*10)


##header.pop('Overview')
header.pop('Parameter info')
header.pop('Scope data')
##print(header.keys())

pprint.pprint(header)

##print('list_section: ', list_section)

# df = pd.DataFrame(header)

# df.set_axis(temp_header, axis=1)

# print(df.head(4))

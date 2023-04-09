from typing import Dict
from tqdm import tqdm
import re

replace_formats = ["select=\"{xpath}\"", "/{xpath}\"", "select=\"*:{xpath}\"", "/*:{xpath}\"",
                   "/{xpath}/", "/*:{xpath}/", ]


def replace_xslt(text: str, mapping_dict: Dict[str, str]) -> str:

    for k, v in tqdm(mapping_dict.items()):
        for replace_format in replace_formats:
            text = text.replace(replace_format.format(xpath=k), replace_format.format(xpath=v))

    return text

#-*- coding: utf-8 -*-
#!/usr/bin/env python

import json
import sys

try:
    content = sys.stdin.read()
    result = json.loads(content)
    print json.dumps(result, sort_keys=True, indent=4).decode('unicode-escape').encode('utf-8')
except:
    print content
    sys.exit(1)

sys.exit(0)

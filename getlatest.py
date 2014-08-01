import urllib2
import json

f = urllib2.urlopen('https://api.github.com/repos/texane/stlink/commits')

latest_commit_sha = json.loads(f.read())[0]['sha'][:7]
f.close()

with open('latest.mk', 'w') as f:
	f.write('# $FreeBSD$\n\nGH_COMMIT = {0}\n'.format(latest_commit_sha))



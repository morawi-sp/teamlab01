/usr/bin/python3 

repo = g.get_repo("PyGithub/PyGithub")
list(repo.get_branches())
commit = repo.get_commit(sha=sha)
print(commit.commit.author.date)

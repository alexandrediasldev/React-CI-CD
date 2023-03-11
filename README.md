# Getting Started with Github Actions

Read the Github tutorial to understand the basic syntax and usages of github actions:  
https://docs.github.com/en/actions/learn-github-actions/understanding-github-actions

This example tutorial shows three big ways of running jobs in github actions

## Manual bash scripting

The easiest way directly write bash to run some commands:
```YAML
run: echo "Hello World!"
```
codeQL is a security tool for discovering vulnerabilities and we want to install and run it using bash commands.  

In this example:
- Download and unzip codeQL
- Use the codeQL executable to download a codeQL extensions for javascript
- Create a database for our code located in src/
- Analyse the database to check if there is any vulnerabilities
```YAML
  codeql:
    runs-on: ubuntu-latest
    needs: lint
    steps:
      - uses: actions/checkout@v2
      - name: Install dependencies
        run: |
            wget -q https://github.com/github/codeql-cli-binaries/releases/download/v2.12.3/codeql-linux64.zip
            unzip codeql-linux64.zip
              
      - name: CodeQL for js  
        run: |
           ./codeql/codeql pack download codeql/javascript-queries
           ./codeql/./codeql database create -l javascript ./db -s src/
            
      - name: CodeQL analysis 
        run: ./codeql/./codeql database analyze --format=CSV --output=output.csv db
```

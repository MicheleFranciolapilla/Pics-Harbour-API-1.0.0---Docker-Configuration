const { spawn } = require('child_process');

let SEED_DB = "true"; 
let MODE = null;

process.argv.slice(2).forEach( arg => 
    {
        switch (arg.toLowerCase()) 
        {
            case "noseed"   :   SEED_DB = "false";
                                break;
            case "-d"       :   MODE = "-d";
                                break;
            default         :   console.log(`Unknown option: ${arg}`);
        }
    });

const dcArgs = [ "up" ];
    if (MODE)
        dcArgs.push(MODE);
const dockerCompose = spawn("docker-compose", dcArgs, 
    {
        stdio   : "inherit",
        env     : { ...process.env, SEED_DB }
    });

dockerCompose.on("error", (err) => 
    {
        console.error(`Failed to start subprocess: ${err}`);
    });

dockerCompose.on("exit", (code, signal) => 
    {
        if (code) 
            console.log(`Process exit with code: ${code}`);
        else if (signal) 
            console.log(`Process killed with signal: ${signal}`);
        else 
            console.log('Docker compose executed successfully');
    });

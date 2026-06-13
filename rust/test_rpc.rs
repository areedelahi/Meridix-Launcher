use discord_rich_presence::{activity, DiscordIpc, DiscordIpcClient};

fn main() {
    let client_id = "1515240427786076250";
    let mut client = match DiscordIpcClient::new(client_id) {
        Ok(c) => c,
        Err(e) => {
            println!("Error new: {:?}", e);
            return;
        }
    };
    
    if let Err(e) = client.connect() {
        println!("Error connect: {:?}", e);
    } else {
        println!("Connected!");
        let act = activity::Activity::new().state("Idle").details("In Launcher");
        if let Err(e) = client.set_activity(act) {
            println!("Error set: {:?}", e);
        } else {
            println!("Set!");
        }
    }
}

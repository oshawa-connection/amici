import { AmiciAPI } from "./AmiciAPI";
import { EventBus } from "./EventBus";
import { GUID } from "./GUID";
import { MessageDisplay } from "./MessageDisplay";
import { PotentialFriendDisplay } from "./PotentialFriendDisplay";
import { UserControlPanel } from "./UserControlPanel";
import { UserRepository } from "./UserRepository";


const userID = new GUID("0b2d143f-3ba6-45ea-b095-d1e7e4ab3175");
// In a bigger app, we would check the window.location to choose which components to create 
// on which page.
(async ()=>{
    const amiciAPI = new AmiciAPI();
    const userRepository = new UserRepository(amiciAPI,userID);
    await userRepository.initialise();
    const eventBus = new EventBus();
    const swipePanel = new UserControlPanel(userRepository,eventBus);    
    const matchDisplay = new MessageDisplay();
    const friendDisplay = new PotentialFriendDisplay(userRepository.getCurrentUser());
})();
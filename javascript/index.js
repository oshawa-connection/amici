import { AmiciAPI } from "./AmiciAPI";
import { EventBus } from "./EventBus";
import { GUID } from "./GUID";
import { NewMatchDisplay } from "./NewMatchDisplay";
import { UserControlPanel } from "./UserControlPanel";
import { UserRepository } from "./UserRepository";


const userID = new GUID("0b2d143f-3ba6-45ea-b095-d1e7e4ab3175");

(async ()=>{
    const amiciAPI = new AmiciAPI();
    const userRepository = new UserRepository(amiciAPI,userID);
    await userRepository.initialise();
    const eventBus = new EventBus();
    const swipePanel = new UserControlPanel(userRepository,eventBus);    
    const matchDisplay = new NewMatchDisplay();
})();



console.log("All constructed")
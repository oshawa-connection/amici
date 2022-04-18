import { AmiciAPI } from "./AmiciAPI";
import { GUID } from "./GUID";
import { UserControlPanel } from "./UserControlPanel";
import { UserRepository } from "./UserRepository";


const userID = new GUID("0b2d143f-3ba6-45ea-b095-d1e7e4ab3175");

(async ()=>{
    const amiciAPI = new AmiciAPI();
    const userRepository = new UserRepository(amiciAPI,userID);
    await userRepository.initialise();
    const swipePanel = new UserControlPanel(userRepository);    
})();



console.log("All constructed")
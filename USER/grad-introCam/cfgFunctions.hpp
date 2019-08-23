class GRAD_introCam {

    class client {
            file = USER\grad-introCam\functions\client;

            class camAttached;
            class camCommands;
            class camFree;
            class camRotate;
            class play;
            class textEffects;
    };

    class server {
            file = USER\grad-introCam\functions\server;

            class addShot;
            class shotDefinitions { postInit = 1; };
    };
};

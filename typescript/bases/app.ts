// tuplas

// (() => {
//     const hero:[
//         string,
//         number
//     ] = ['Ironman',100]

//     hero[0] = 'Spiderman';
//     hero[1] = 200;
//     console.log(hero);
// })();

// enums

// (() => {
//     enum AudioLevel {
//         min = 1,
//         medium = 5,
//         max = 10
//     }

//     let currentAudio: AudioLevel = AudioLevel.medium;
//     console.log(currentAudio);
// })();

// void

// (() => {
//     const callBatman = (): void => {
//         return;
//     }

//     const callSuperman = (): void => {
//         return console.log('Superman called');
//     }

//     callBatman();
//     callSuperman();
// })();

// never    
// (() => {
//     const error = (message: string): never => {
//         throw new Error(message);
//     } 
//     const infinite = (): never => {
//         while (true) {}
//     }
//     error('Error fatal');
//     infinite();
// })();

// null y undefined
// (() => {
//     const nada: undefined = undefined;
//     const nada2: null = null;
//     const nada3: void = undefined;
//     const nada4: void = null;
//     console.log(nada, nada2, nada3, nada4);
// })();


// rest Args

// (() => {
//     const fullName = (firstName: string, ...restArgs: string[]): string => {
//         return `${firstName} ${restArgs.join(' ')}`;
//     }
//     const resultado = fullName('Sergio', 'Mata', 'Gonzalez');
//     console.log(resultado);
// })();


// import { Hero as SuperHero } from './classes/Hero';
// import powers,  { Power } from './data/powers';

// console.log('Hola Mundo!');

// const ironman = new SuperHero('Ironman', 1, 45);
// console.log(ironman);

// console.log('Poderes disponibles:');
// powers.forEach((power: Power) => {
//     console.log(`${power.id} - ${power.desc}`);
// });


import { genericFunction } from '../generics/generics';
import { Hero, Villain } from '../interfaces';

console.log('genericFunction result:', genericFunction('Hello World!'));

const deadpool= {
    name: 'Deadpool',
    realName: 'Wade Wilson',
    evilPlan: 'Take over the world with tacos'
};

console.log( genericFunction<Hero>(deadpool).realName );
console.log( genericFunction<Villain>(deadpool).evilPlan );
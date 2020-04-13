require("@rails/ujs").start();
// import jQuery from "jquery"

// import {foo, haha} from "../custom/test";

import * as test from '../custom/test'

test.haha();

console.log(test.foo);
console.log(NODE_ENV);
console.log(jQuery.fn.jquery);

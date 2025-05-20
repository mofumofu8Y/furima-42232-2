// globalthis/polyfill@1.0.4 downloaded from https://ga.jspm.io/npm:globalthis@1.0.4/polyfill.js

import e from"./implementation.js";var a=typeof globalThis!=="undefined"?globalThis:typeof self!=="undefined"?self:global;var t={};var l=e;t=function getPolyfill(){return typeof a==="object"&&a&&a.Math===Math&&a.Array===Array?a:l};var o=t;export{o as default};


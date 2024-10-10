const map = {'{': 1, '}': -1, '(': 2, ')': -2, '[': 3, ']': -3};
const str = '([]{})';
let stack = [];
str.split('').forEach((bracket) => {
    if (map[bracket] > 0) stack.push(map[bracket])
    else if (stack[stack.length - 1] && stack[stack.length - 1] + map[bracket] == 0) stack.pop()
    else if(stack[stack.length -1] && stack[stack.length-1]+ map[bracket] != 0) stack.push(map[bracket])
    console.log(stack);
})
console.log(stack.length==0 ? true:false)
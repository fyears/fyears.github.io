---
published: true
layout: post
title: learn React the easy way
tags:
  - javascript
  - front end
  - technology
categories: technology
---

## tl;dr

Remember the core idea in [React](https://facebook.github.io/react/): `UI = func(const props, state)`.

## what exactly is React?

Quoted from the [official page](https://facebook.github.io/react/): "A JavaScript library for building user interfaces". Nothing more and nothing less. And I would like to conclude the code idea of it: `UI = func(const props, state)`, nothing more and nothing less.

While you are searching tutorials about React online, many fancy words bump up: "JSX", "virtual diff", "component"... But if you keep the core idea in mind, you would not lose yourself in new words sea.

"JSX" is a syntax sugar to help writing HTML/XML-like JS codes, with normal JS statements inside braces `{` and `}`. "virtual diff" is an internal algorithm design to speed up the visual effects, which is not important for junior learner. "component" is what usually a piece or a block of React codes trying to represent a unit of UI "thing", like a form, a table, a headline area, a user input area.

## how to prepare the development environment?

Install node.js with `npm`. Use [`create-react-app`](https://github.com/facebookincubator/create-react-app). Learn [modern JS](https://babeljs.io/learn-es2015/) firstly.

## how to think in React?

["Think the UI as a component hierarchy"](https://facebook.github.io/react/docs/thinking-in-react.html). In short, try to abstract the elements in UI as different kinds of abstract block, a.k.a "component". Natually it's like a tree, like, a large component wraps some small same or different kinds of components, that also wrap even smaller components. Then group the same kind of components into the same piece of React and JS codes.

## how to define a `React.Component`?

Any `React.Component` receives `props` as the argument of its constructor (which could be empty), and optionally holds some `state`inside.

Old codes use `React.createClass` to create classes of components. Don't do that in new code. But it may show up in some tutorials.

There are at least two ways to create classes of components as shown below. When in doubt, use the first one.

Firstly, here is a ES6+ "class component" way. Also check out [this post](https://babeljs.io/blog/2015/06/07/react-on-es6-plus) for reference.

```js
class MyComp extends React.Component {
  constructor(props) {
    super(props);
    this.state = {users: []}; /* some init state */

    /* remember to bind some functions */
    this.customMethod2 = this.customMethod2.bind(this);
  }

  customMethod1 = (arg1, arg2) => {
    /* one custom method */
    /* define it in arrow function assignment way, then no need to bind it to this */
  }

  customMethod2(arg1, arg2) {
    /* another custom method */
    /* define it in natural way, usually need to bind it to this in constructor */
  }

  componentDidMount() {
    /* usually do some init AJAX calls here. similar to jQuery('document').ready() */
    /* example: fetching users and setting the state */
    fetch('/users.json')
      .then(res => res.json())
      .then(data => this.setState({users: data.users}));
  }

  render() {
    /* the render() function is always needed */
    /* example: display all users */
    let userList = this.state.users.map(u => <li>u</li>);
    return (
      <div>
        <h1>{this.props.compTitle}</h1>
        <ul>userList</ul>
      </div>
    );
  }
}
```

Secondly, here is the simplified "functional component" way. Functional components are also called stateless components, or pure components, or dumb components. As the namaes imply, they do not have `state`, and are totally determined by the argument `props`.

```js
/* accepting props as the argument */
const MyPureComp1 = (props) => {
  return (
    <div>{props.p1}, {props.p2}</div>
  );
};

/* or, even directly destructuring the props */
const MyPureComp2 = ({p1, p2, ...rest}) => {
  return (
    <div>{p1}, {p2}</div>
  );
}
```

And that's it! After defining the tree of the components, we only need to render it into the real DOM:

```js
ReactDOM.render(
  <MyRootComponent />,
  document.getElementById('root')
);
```

## transfer data / message from children to parents / cousins

In short: use callback (if without other libraries). Check out the official document: [Lifting State Up](https://facebook.github.io/react/docs/lifting-state-up.html) for reference.

Core idea how data flow in React: data flow from parent component to its children components by setting the children components' `props`-es and rendering them. In other words, the data flow from the root of the component tree to the leaves. Sometimes some nodes in the component tree fetch data from outside via something like `fetch()`, but then they transfer the data to their children in the same way.

So how to transfer data from children to parents? Use callback. The parent registers some functions as part of the children's `props`-es. Then the children components call those functions when necessary, after which the parent handle the data / message from children. That's it.

If we want to transfer data from one component to its cousins, we need to move the data up to the lowest common ancestor by callbacks, then move the data down to the cousins by setting `props`-es.

Consider the following example.

```txt
+---------------------------+
| App                       |
|                           |
| +-----------------------+ |
| | Controller            | |
| |                       | |
| | +--------+ +--------+ | |
| | | button | | button | | |
| | +--------+ +--------+ | |
| |                       | |
| +-----------------------+ |
|                           |
| +-----------------------+ |
| | Displayer             | |
| +-----------------------+ |
|                           |
+---------------------------+
```

```js
class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {number: 0};
  }
  handleClick = (action) => {
    let n = this.state.number;
    if (action === 'inc') {
      n += 1;
    } else {
      n -= 1;
    }
    this.setState({number: n});
    return n;
  }
  render() {
    return (
      <div>
        <Controller handleClick={this.handleClick} />
        <Displayer number={this.state.number} />
      </div>
    );
  }
}

class Controller extends React.Component {
  handleInc = (e) => {
    e.preventDefault();
    return this.props.handleClick('inc');
  }
  handleDec = (e) => {
    e.preventDefault();
    return this.props.handleClick('dec');
  }
  render () {
    return (
      <div>
        <button onClick={this.handleInc}>increase</button>
        <button onClick={this.handleDec}>decrease</button>
      </div>
    );
  }
}

class Displayer extends React.Component {
  render() {
    return <div>current number: {this.props.number}</div>;
  }
}
```

In `Controller`, after the button being clicked, the `action` (either `inc` or `dec`) is transfer upwards to `App` by calling the callback set as `Controller`'s `props.handleClick()` by the parent `App`. Then the `App` move the information downwards to `Displayer` by setting `Displayer`'s `props.number`. The whole thing works like magic, but it still follows the core idea `UI = func(const props, state)`.

## advanced topics

It's sufficient to write application in React after fully understanding the above concepts. Write codes for components and consider how to deal with data transfer, avoiding directly manipulating DOM in old jQuery-like way.

Of course, while the application become even larger, things always get harder. One important thing to consider is how to manage the data. (React itself mainly focuses on displaying the data.) One widely adopted way to solve this problem is using [Redux](http://redux.js.org/), that is another big and not-very-easy-to-understand topic.

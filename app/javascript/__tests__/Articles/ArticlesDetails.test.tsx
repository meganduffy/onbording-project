import * as React from 'react';
import { render, unmountComponentAtNode } from "react-dom";
import { act } from "react-dom/test-utils";
import ArticleDetails from '../../components/Articles/ArticlesDetails';

let container = null;

beforeEach(() => {
  container = document.createElement("div");
  document.body.appendChild(container);
});

afterEach(() => {
  unmountComponentAtNode(container);
  container.remove();
  container = null;
});

it( 'renders with a title', ()=>{
    act( ()=>{render(<ArticleDetails title='New Post'/>, container)} )
        expect(container.textContent).toBe("New Post")
});

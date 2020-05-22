import React from "react";
import "@testing-library/jest-dom/extend-expect";
import {
  render,
  getByText,
  getByTestId,
  queryByTestId,
  queryAllByTestId,
} from "@testing-library/react";
import ArticlesList from "../../components/Articles/ArticlesList";
import ArticleDetails from "../../components/Articles/ArticlesDetails";

const expectedSinleArticle = [
  {
    id: 1,
    title: "mechanism momentum museum minimum mushroom",
    content:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    created_at: "2020-03-27T10:53:09.881Z",
    user: { first_name: "Megan", lastName: "Duffy" },
    link: "/articles/1",
    linkText: "View Full Article",
  },
];
const expectedMultiArticles = [
  {
    id: 1,
    title: "mechanism momentum museum minimum mushroom",
    content:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    created_at: "2020-03-27T10:53:09.881Z",
    user: { first_name: "Megan", lastName: "Duffy" },
    link: "/articles/1",
    linkText: "View Full Article",
  },

  {
    id: 2,
    title: "green vegetable saw comparison",
    content:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    created_at: "2020-03-29T10:53:09.881Z",
    user: { first_name: "Matthew", lastName: "Duffy" },
    link: "/articles/2",
    linkText: "View Full Article",
  },
];
const expectedCurrentUser = 1;

describe("ArticleList", () => {
  describe("Snapshots", () => {
    test("should render the Article List when there is only one article", () => {
      const { container } = render(
        <ArticlesList articles={expectedSinleArticle} />
      );
      expect(container).toMatchSnapshot();
    });

    test("should render the Article List when logged out", () => {
      const { container } = render(
        <ArticlesList articles={expectedMultiArticles} />
      );
      expect(container).toMatchSnapshot();
    });

    test("should render the Article List when logged in", () => {
      const { container } = render(
        <ArticlesList
          articles={expectedMultiArticles}
          currentUser={expectedCurrentUser}
        />
      );
      expect(container).toMatchSnapshot();
    });
  });

  describe("Props", () => {
    test("should render an Article Details component for each article passed to it", () => {
      const { container } = render(
        <ArticlesList articles={expectedMultiArticles} />
      );
      expect(queryAllByTestId(container, "article-details").length).toEqual(
        expectedMultiArticles.length
      );
    });
  });
});

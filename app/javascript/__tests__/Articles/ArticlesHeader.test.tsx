import React from "react";
import "@testing-library/jest-dom/extend-expect";
import { render, queryByTestId } from "@testing-library/react";
import ArticlesHeader from "../../components/Articles/ArticlesHeader";

const expectedTitle = "Demonic Cats";
const expectedSubtitle = "And the people who love them.";
const expectedLink = "http://localhost/";

describe("ArticlesHeader", () => {
  describe("Snapshots", () => {
    test("should render as expected", () => {
      const { container } = render(
        <ArticlesHeader
          title={expectedTitle}
          subtitle={expectedSubtitle}
          link={expectedLink}
        />
      );
      expect(container).toMatchSnapshot();
    });
  });

  describe("Props", () => {
    test("should render the text passed to it", () => {
      const { container } = render(
        <ArticlesHeader
          title={expectedTitle}
          subtitle={expectedSubtitle}
          link={expectedLink}
        />
      );
      expect(container).toHaveTextContent(expectedTitle);
      expect(container).toHaveTextContent(expectedSubtitle);
    });

    test("should render the href passed to it", () => {
      const { container } = render(
        <ArticlesHeader
          title={expectedTitle}
          subtitle={expectedSubtitle}
          link={expectedLink}
        />
      );
      expect(queryByTestId(container, "article-header-link").href).toBe(
        expectedLink
      );
    });
  });
});

import React from "react";
import "./widgetLg.css";
export default function WidgetLg() {
  const Button = ({ type }) => {
    return <button className={"widgetLgButton " + type}>{type}</button>;
  };
  return (
    <div className="widgetLg">
      <h3 className="widgetLgTitle">Latest Transaction</h3>
      <table className="widgetLgTable">
        <tr className="widgetLgTr">
          <th className="widgetLgTh">Customer</th>
          <th className="widgetLgTh">Date</th>
          <th className="widgetLgTh">Amount</th>
          <th className="widgetLgTh">Status</th>
        </tr>
        <tr className="widgetLgTr">
          <td className="widgetUser">
            <img
              src="https://images.pexels.com/photos/1526814/pexels-photo-1526814.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
              className="widgetLgImg"
              alt=""
            />
            <span className="widgetLgName">Carol</span>
          </td>
          <td className="widgetLgDate">2 Jun 2020</td>
          <td className="widgetLgAmount">$ 1220</td>
          <td className="widgetLgStatus">
            <Button type="Approved" />
          </td>
        </tr>
        <tr className="widgetLgTr">
          <td className="widgetUser">
            <img
              src="https://images.pexels.com/photos/1526814/pexels-photo-1526814.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
              className="widgetLgImg"
              alt=""
            />
            <span className="widgetLgName">Carol</span>
          </td>
          <td className="widgetLgDate">2 Jun 2020</td>
          <td className="widgetLgAmount">$ 1220</td>
          <td className="widgetLgStatus">
            <Button type="Declined" />
          </td>
        </tr>
        <tr className="widgetLgTr">
          <td className="widgetUser">
            <img
              src="https://images.pexels.com/photos/1526814/pexels-photo-1526814.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
              className="widgetLgImg"
              alt=""
            />
            <span className="widgetLgName">Carol</span>
          </td>
          <td className="widgetLgDate">2 Jun 2020</td>
          <td className="widgetLgAmount">$ 1220</td>
          <td className="widgetLgStatus">
            <Button type="Pending" />
          </td>
        </tr>
      </table>
    </div>
  );
}

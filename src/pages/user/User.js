import React from "react";
import "./user.css";
import {
  PermIdentity,
  CalendarToday,
  LocationSearching,
  PhoneAndroid,
  MailOutline,
  Publish,
} from "@material-ui/icons";
import { Link } from "react-router-dom";
export default function User() {
  return (
    <div className="user">
      <div className="userTitleContainer">
        <h1 className="userTitle">Edit User</h1>
        <Link to="/newUser">
          <button className="userAddButton">Create</button>
        </Link>
      </div>
      <div className="userContainer">
        <div className="userShow">
          <div className="userShowTop">
            <img
              className="userShowImg"
              alt=""
              src="https://images.pexels.com/photos/1526814/pexels-photo-1526814.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
            />
            <div className="userShowTopTitle">
              <span className="userShowUsername">Anne</span>
              <span className="userShowTitle">Software Engineer</span>
            </div>
          </div>
          <div className="userShowBottom">
            <span className="userShowTitle">Account Detail</span>
            <div className="useShowInfo">
              <PermIdentity className="userShowIcon" />
              <span className="userShowInfoTitle">anna99</span>
            </div>
            <div className="useShowInfo">
              <CalendarToday className="userShowIcon" />
              <span className="userShowInfoTitle">10.12.1999</span>
            </div>

            <span className="userShowTitle">Contact Detail</span>

            <div className="useShowInfo">
              <PhoneAndroid className="userShowIcon" />
              <span className="userShowInfoTitle">09110012</span>
            </div>

            <div className="useShowInfo">
              <MailOutline className="userShowIcon" />
              <span className="userShowInfoTitle">anna99@gmail.com</span>
            </div>

            <div className="useShowInfo">
              <LocationSearching className="userShowIcon" />
              <span className="userShowInfoTitle">New York</span>
            </div>
          </div>
        </div>
        <div className="userUpdate">
          <span className="userUpdateTitle">Edit</span>
          <form className="userUpdateForm">
            <div className="userUpdateLeft">
              <div className="userUpdateItem">
                <label>Username</label>
                <input
                  type="text"
                  placeholder="anna99"
                  className="userUpdateInput"
                />
              </div>
              <div className="userUpdateItem">
                <label>Full name</label>
                <input
                  type="text"
                  placeholder="Anne"
                  className="userUpdateInput"
                />
              </div>
              <div className="userUpdateItem">
                <label>Email</label>
                <input
                  type="text"
                  placeholder="anna99@gmail.com"
                  className="userUpdateInput"
                />
              </div>
              <div className="userUpdateItem">
                <label>Phone</label>
                <input
                  type="text"
                  placeholder="09110012"
                  className="userUpdateInput"
                />
              </div>
              <div className="userUpdateItem">
                <label>Address</label>
                <input
                  type="text"
                  placeholder="New York"
                  className="userUpdateInput"
                />
              </div>
            </div>
            <div className="userUpdateRight">
              <div className="userUpdateUpload">
                <img
                  className="userUpdateImg"
                  alt=""
                  src="https://images.pexels.com/photos/1526814/pexels-photo-1526814.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500"
                />
                <label htmlFor="file">
                  <Publish className="userUpdateIcon" />
                </label>
                <input type="file" id="file" style={{ display: "none" }} />
              </div>
              <button className="userUpdateButton">Update</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
}

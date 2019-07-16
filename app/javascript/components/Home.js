import React from "react"
import PropTypes from "prop-types"
class Home extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      data: "",
      search: {
        name: "",
        uid: "",
        gid: "",
        comment: "",
        home: "",
        shell: ""
      },
      group_search: {
        name: "",
        gid: "",
        member: ""
      },
      uid_search: {
        uid: ""
      },
      gid_search: {
        gid: ""
      },
      uid_group_search: {
        uid: ""
      }
    }
  }

  displayUsers = () => {
    fetch("/users")
    .then(response => {
      return response.json();
    })
    .then(json => {
      let { data } = this.state
      this.setState({ data: json });
    })
    .catch(e => {
      console.log("Error", e);
    })
  }

  displayGroups = () => {
    fetch("/groups")
    .then(response => {
      return response.json();
    })
    .then(json => {
      let { data } = this.state
      this.setState({ data: json });
    })
    .catch(e => {
      console.log("Error", e);
    })
  }

searchUsers = () => {
  let { name, uid, gid, comment, home, shell } = this.state.search
  let params = {}
  if (name.match(/\S/)){
    params.name = name;
  }
  if (uid.match(/\S/)){
    params.uid = uid;
  }
  if (gid.match(/\S/)){
    params.gid = gid;
  }
  if (comment.match(/\S/)){
    params.comment = comment;
  }
  if (home.match(/\S/)){
    params.home = home;
  }
  if (shell.match(/\S/)){
    params.shell = shell;
  }
  let url = new URL("http://localhost:3000/users/query")

  Object.keys(params).forEach(key => url.searchParams.append(key, params[key]))
  fetch(url)
  .then(response => {
    return response.json();
  }).then(json => {
		let { data } = this.state
    this.setState({ data: json });
    })
    .catch(e => {
      console.log("Error", e);
    })
}

searchGroups = () => {
  let { name, gid, member } = this.state.group_search
  let params = {}
  if (name.match(/\S/)){
    params.name = name;
  }
  if (gid.match(/\S/)){
    params.gid = gid;
  }
  if (member.match(/\S/)){
    params.member = member;
  }
  let url = new URL("http://localhost:3000/groups/query")

  Object.keys(params).forEach(key => url.searchParams.append(key, params[key]))
  fetch(url)
  .then(response => {
    return response.json();
  }).then(json => {
		let { data } = this.state
    this.setState({ data: json });
    })
    .catch(e => {
      console.log("Error", e);
    })
}

searchUID = () => {
  let { uid } = this.state.uid_search
  fetch(`/users/${uid}`)
  .then(response => {
    return response.json();
  }).then(json => {
    let { data } = this.state
    this.setState({ data: json })
  })
  .catch(e => {
    this.setState({ data: "404 not found" })
  })
}

searchGroupGID = () => {
  let { gid } = this.state.gid_search
  fetch(`/groups/${gid}`)
  .then(response => {
    return response.json();
  }).then(json => {
    let { data } = this.state
    this.setState({ data: json })
  })
  .catch(e => {
    this.setState({ data: "404 not found" })
  })
}

searchGroupUID = () => {
  let { uid } = this.state.uid_group_search
  fetch(`/users/${uid}/groups`)
  .then(response => {
    return response.json();
  }).then(json => {
    this.setState({ data: json })
  })
  .catch(e => {
    this.setState({ data: "404 not found" })
  })
}

  handleChange = (event) => {
    let { search } = this.state
    search[event.target.name] = event.target.value
    this.setState({ name: name })
  }

  handleGroupSearch = (event) => {
    let { group_search } = this.state
    group_search[event.target.name] = event.target.value
    this.setState({ name: name })
  }

  handleUID = (event) => {
    let { uid_search } = this.state
    uid_search[event.target.name] = event.target.value
    this.setState({ name: name })
  }

  handleGroupGID = (event) => {
    let { gid_search } = this.state
    gid_search[event.target.name] = event.target.value
    this.setState({ name: name })
  }

  handleGroupUID = (event) => {
    let { uid_group_search } = this.state
    uid_group_search[event.target.name] = event.target.value
    this.setState({ name: name })
  }

  render () {
    return (
      <React.Fragment>
        <h1>Hello World</h1>
        <table cellPadding="30">
          <tbody>
            <tr>
              <td>
                <table>
                  <tbody>
                    <tr>
                      <td><button type="button" onClick={this.displayUsers}> Display all users</button></td>
                    </tr>
                    <tr>
                      <td>
                        <form>
                          <fieldset>
                          <legend>User Search</legend>
                          Any or all fields may be filled.<br/>
                          Name:<br/>
                          <input 
                            type="text" 
                            name="name" 
                            onChange={this.handleChange}
                            value={this.state.search.name}
                            /><br/>
                          UID:<br/>
                          <input 
                            type="text" 
                            name="uid" 
                            onChange={this.handleChange}
                            value={this.state.search.uid}
                            /><br/>
                          GID:<br/>
                          <input 
                            type="text" 
                            name="gid" 
                            onChange={this.handleChange}
                            value={this.state.search.gid}
                            /><br/>
                          Comment:<br/>
                          <input 
                            type="text" 
                            name="comment" 
                            onChange={this.handleChange}
                            value={this.state.search.comment}
                            /><br/>
                          Home:<br/>
                          <input 
                            type="text" 
                            name="home" 
                            onChange={this.handleChange}
                            value={this.state.search.home}
                            /><br/>
                          Shell:<br/>
                          <input 
                            type="text" 
                            name="shell" 
                            onChange={this.handleChange}
                            value={this.state.search.shell}
                            /><br/>
                              <button type="button" onClick={this.searchUsers}>Search for user</button>
                            </fieldset>
                        </form> 
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <form>
                          <fieldset>
                            <legend>Search user by UID</legend>
                            UID:<br/>
                            <input
                              type="text"
                              name="uid"
                              onChange={this.handleUID}
                              value={this.state.uid_search.uid}
                            /><br/>
                              <button type="button" onClick={this.searchUID}>Search for user</button>
                          </fieldset>
                        </form>
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <form>
                          <fieldset>
                            <legend>Search for a user's groups by user UID</legend>
                            UID:<br/>
                            <input
                              type="text"
                              name="uid"
                              onChange={this.handleGroupUID}
                              value={this.state.uid_group_search.uid}
                            /><br/>
                              <button type="button" onClick={this.searchGroupUID}>Search for groups by user UID</button>
                          </fieldset>
                        </form>
                      </td>
                    </tr>
                    <tr>
                      <td><button type="button" onClick={this.displayGroups}> Display all groups</button></td>
                    </tr>
                    <tr>
                      <td>
                        <form>
                          <fieldset>
                          <legend>Group Search</legend>
                          Any or all fields may be filled.<br/>
                          Name:<br/>
                          <input 
                            type="text" 
                            name="name" 
                            onChange={this.handleGroupSearch}
                            value={this.state.group_search.name}
                            /><br/>
                          GID:<br/>
                          <input 
                            type="text" 
                            name="gid" 
                            onChange={this.handleGroupSearch}
                            value={this.state.group_search.gid}
                            /><br/>
                          User(s).  Seperate users by ", ":<br/>
                          <input 
                            type="text" 
                            name="member" 
                            onChange={this.handleGroupSearch}
                            value={this.state.group_search.member}
                            /><br/>
                              <button type="button" onClick={this.searchGroups}>Search for groups</button>
                            </fieldset>
                        </form> 
                      </td>
                    </tr>
                    <tr>
                      <td>
                        <form>
                          <fieldset>
                            <legend>Search group by GID</legend>
                            GID:<br/>
                            <input
                              type="text"
                              name="gid"
                              onChange={this.handleGroupGID}
                              value={this.state.gid_search.gid}
                            /><br/>
                              <button type="button" onClick={this.searchGroupGID}>Search for group</button>
                          </fieldset>
                        </form>
                      </td>
                    </tr>
                  </tbody>
                </table>
              </td>
              <td>{this.state.data}</td>
            </tr>
          </tbody>
        </table> 
      </React.Fragment>
    );
  }
}

export default Home
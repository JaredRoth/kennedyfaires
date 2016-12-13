var HelloWorld = React.createClass({
  propTypes: {
    name: React.PropTypes.string.isRequired,
    address: React.PropTypes.string.isRequired,
    otherThing: React.PropTypes.string.isRequired
  },

  render: function() {
    return (
      <div>
        <div>Name: {this.props.name}</div>
        <div>Address: {this.props.address}</div>
        <div>Other Thing: {this.props.otherThing}</div>
      </div>
    );
  }
});

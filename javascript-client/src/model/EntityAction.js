/**
 * Puzzler 2018
 * Control your bot. Collect. Store. Win.
 *
 * OpenAPI spec version: 1.0.0
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 *
 * Swagger Codegen version: 2.3.1
 *
 * Do not edit the class manually.
 *
 */

(function(root, factory) {
  if (typeof define === 'function' && define.amd) {
    // AMD. Register as an anonymous module.
    define(['ApiClient', 'model/Action'], factory);
  } else if (typeof module === 'object' && module.exports) {
    // CommonJS-like environments that support module.exports, like Node.
    module.exports = factory(require('../ApiClient'), require('./Action'));
  } else {
    // Browser globals (root is window)
    if (!root.Puzzler2018) {
      root.Puzzler2018 = {};
    }
    root.Puzzler2018.EntityAction = factory(root.Puzzler2018.ApiClient, root.Puzzler2018.Action);
  }
}(this, function(ApiClient, Action) {
  'use strict';




  /**
   * The EntityAction model module.
   * @module model/EntityAction
   * @version 1.0.0
   */

  /**
   * Constructs a new <code>EntityAction</code>.
   * @alias module:model/EntityAction
   * @class
   */
  var exports = function() {
    var _this = this;



  };

  /**
   * Constructs a <code>EntityAction</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/EntityAction} obj Optional instance to populate.
   * @return {module:model/EntityAction} The populated <code>EntityAction</code> instance.
   */
  exports.constructFromObject = function(data, obj) {
    if (data) {
      obj = obj || new exports();

      if (data.hasOwnProperty('id')) {
        obj['id'] = ApiClient.convertToType(data['id'], 'Number');
      }
      if (data.hasOwnProperty('action')) {
        obj['action'] = Action.constructFromObject(data['action']);
      }
    }
    return obj;
  }

  /**
   * @member {Number} id
   */
  exports.prototype['id'] = undefined;
  /**
   * @member {module:model/Action} action
   */
  exports.prototype['action'] = undefined;



  return exports;
}));


# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `hashdiff` gem.
# Please instead update this file by running `bin/tapioca gem hashdiff`.

# This module provides methods to diff two hash, patch and unpatch hash
#
# source://hashdiff//lib/hashdiff/util.rb#3
module Hashdiff
  class << self
    # Best diff two objects, which tries to generate the smallest change set using different similarity values.
    #
    # Hashdiff.best_diff is useful in case of comparing two objects which include similar hashes in arrays.
    #
    # @example
    #   a = {'x' => [{'a' => 1, 'c' => 3, 'e' => 5}, {'y' => 3}]}
    #   b = {'x' => [{'a' => 1, 'b' => 2, 'e' => 5}] }
    #   diff = Hashdiff.best_diff(a, b)
    #   diff.should == [['-', 'x[0].c', 3], ['+', 'x[0].b', 2], ['-', 'x[1].y', 3], ['-', 'x[1]', {}]]
    # @param obj1 [Array, Hash]
    # @param obj2 [Array, Hash]
    # @param options [Hash] the options to use when comparing
    #   * :strict (Boolean) [true] whether numeric values will be compared on type as well as value.  Set to false to allow comparing Integer, Float, BigDecimal to each other
    #   * :indifferent (Boolean) [false] whether to treat hash keys indifferently.  Set to true to ignore differences between symbol keys (ie. {a: 1} ~= {'a' => 1})
    #   * :delimiter (String) ['.'] the delimiter used when returning nested key references
    #   * :numeric_tolerance (Numeric) [0] should be a positive numeric value.  Value by which numeric differences must be greater than.  By default, numeric values are compared exactly; with the :tolerance option, the difference between numeric values must be greater than the given value.
    #   * :strip (Boolean) [false] whether or not to call #strip on strings before comparing
    #   * :array_path (Boolean) [false] whether to return the path references for nested values in an array, can be used for patch compatibility with non string keys.
    #   * :use_lcs (Boolean) [true] whether or not to use an implementation of the Longest common subsequence algorithm for comparing arrays, produces better diffs but is slower.
    # @return [Array] an array of changes.
    #   e.g. [[ '+', 'a.b', '45' ], [ '-', 'a.c', '5' ], [ '~', 'a.x', '45', '63']]
    # @since 0.0.1
    # @yield [path, value1, value2] Optional block is used to compare each value, instead of default #==. If the block returns value other than true of false, then other specified comparison options will be used to do the comparison.
    #
    # source://hashdiff//lib/hashdiff/diff.rb#31
    def best_diff(obj1, obj2, options = T.unsafe(nil), &block); end

    # check if objects are comparable
    #
    # @private
    # @return [Boolean]
    #
    # source://hashdiff//lib/hashdiff/util.rb#108
    def comparable?(obj1, obj2, strict = T.unsafe(nil)); end

    # check for equality or "closeness" within given tolerance
    #
    # @private
    #
    # source://hashdiff//lib/hashdiff/util.rb#86
    def compare_values(obj1, obj2, options = T.unsafe(nil)); end

    # count node differences
    #
    # @private
    #
    # source://hashdiff//lib/hashdiff/util.rb#25
    def count_diff(diffs); end

    # count total nodes for an object
    #
    # @private
    #
    # source://hashdiff//lib/hashdiff/util.rb#36
    def count_nodes(obj); end

    # try custom comparison
    #
    # @private
    #
    # source://hashdiff//lib/hashdiff/util.rb#119
    def custom_compare(method, key, obj1, obj2); end

    # decode property path into an array
    # e.g. "a.b[3].c" => ['a', 'b', 3, 'c']
    #
    # @param path [String] Property-string
    # @param delimiter [String] Property-string delimiter
    # @private
    #
    # source://hashdiff//lib/hashdiff/util.rb#58
    def decode_property_path(path, delimiter = T.unsafe(nil)); end

    # Compute the diff of two hashes or arrays
    #
    # @example
    #   a = {"a" => 1, "b" => {"b1" => 1, "b2" =>2}}
    #   b = {"a" => 1, "b" => {}}
    #
    #   diff = Hashdiff.diff(a, b)
    #   diff.should == [['-', 'b.b1', 1], ['-', 'b.b2', 2]]
    # @param obj1 [Array, Hash]
    # @param obj2 [Array, Hash]
    # @param options [Hash] the options to use when comparing
    #   * :strict (Boolean) [true] whether numeric values will be compared on type as well as value.  Set to false to allow comparing Integer, Float, BigDecimal to each other
    #   * :indifferent (Boolean) [false] whether to treat hash keys indifferently.  Set to true to ignore differences between symbol keys (ie. {a: 1} ~= {'a' => 1})
    #   * :similarity (Numeric) [0.8] should be between (0, 1]. Meaningful if there are similar hashes in arrays. See {best_diff}.
    #   * :delimiter (String) ['.'] the delimiter used when returning nested key references
    #   * :numeric_tolerance (Numeric) [0] should be a positive numeric value.  Value by which numeric differences must be greater than.  By default, numeric values are compared exactly; with the :tolerance option, the difference between numeric values must be greater than the given value.
    #   * :strip (Boolean) [false] whether or not to call #strip on strings before comparing
    #   * :array_path (Boolean) [false] whether to return the path references for nested values in an array, can be used for patch compatibility with non string keys.
    #   * :use_lcs (Boolean) [true] whether or not to use an implementation of the Longest common subsequence algorithm for comparing arrays, produces better diffs but is slower.
    # @return [Array] an array of changes.
    #   e.g. [[ '+', 'a.b', '45' ], [ '-', 'a.c', '5' ], [ '~', 'a.x', '45', '63']]
    # @since 0.0.1
    # @yield [path, value1, value2] Optional block is used to compare each value, instead of default #==. If the block returns value other than true of false, then other specified comparison options will be used to do the comparison.
    #
    # source://hashdiff//lib/hashdiff/diff.rb#78
    def diff(obj1, obj2, options = T.unsafe(nil), &block); end

    # diff array using LCS algorithm
    #
    # @private
    # @yield [links]
    #
    # source://hashdiff//lib/hashdiff/diff.rb#119
    def diff_array_lcs(arraya, arrayb, options = T.unsafe(nil)); end

    # caculate array difference using LCS algorithm
    # http://en.wikipedia.org/wiki/Longest_common_subsequence_problem
    #
    # @private
    #
    # source://hashdiff//lib/hashdiff/lcs.rb#8
    def lcs(arraya, arrayb, options = T.unsafe(nil)); end

    # get the node of hash by given path parts
    #
    # @private
    #
    # source://hashdiff//lib/hashdiff/util.rb#75
    def node(hash, parts); end

    # Apply patch to object
    #
    # @param obj [Hash, Array] the object to be patched, can be an Array or a Hash
    # @param changes [Array] e.g. [[ '+', 'a.b', '45' ], [ '-', 'a.c', '5' ], [ '~', 'a.x', '45', '63']]
    # @param options [Hash] supports following keys:
    #   * :delimiter (String) ['.'] delimiter string for representing nested keys in changes array
    # @return the object after patch
    # @since 0.0.1
    #
    # source://hashdiff//lib/hashdiff/patch.rb#17
    def patch!(obj, changes, options = T.unsafe(nil)); end

    # source://hashdiff//lib/hashdiff/util.rb#137
    def prefix_append_array_index(prefix, array_index, opts); end

    # source://hashdiff//lib/hashdiff/util.rb#129
    def prefix_append_key(prefix, key, opts); end

    # judge whether two objects are similar
    #
    # @private
    # @return [Boolean]
    #
    # source://hashdiff//lib/hashdiff/util.rb#7
    def similar?(obja, objb, options = T.unsafe(nil)); end

    # Unpatch an object
    #
    # @param obj [Hash, Array] the object to be unpatched, can be an Array or a Hash
    # @param changes [Array] e.g. [[ '+', 'a.b', '45' ], [ '-', 'a.c', '5' ], [ '~', 'a.x', '45', '63']]
    # @param options [Hash] supports following keys:
    #   * :delimiter (String) ['.'] delimiter string for representing nested keys in changes array
    # @return the object after unpatch
    # @since 0.0.1
    #
    # source://hashdiff//lib/hashdiff/patch.rb#58
    def unpatch!(obj, changes, options = T.unsafe(nil)); end

    private

    # checks if both objects are Arrays or Hashes
    #
    # @private
    # @return [Boolean]
    #
    # source://hashdiff//lib/hashdiff/util.rb#151
    def any_hash_or_array?(obja, objb); end
  end
end

# Used to compare hashes
#
# @private
#
# source://hashdiff//lib/hashdiff/compare_hashes.rb#6
class Hashdiff::CompareHashes
  class << self
    # source://hashdiff//lib/hashdiff/compare_hashes.rb#8
    def call(obj1, obj2, opts = T.unsafe(nil)); end
  end
end

# Used to compare arrays using the lcs algorithm
#
# @private
#
# source://hashdiff//lib/hashdiff/lcs_compare_arrays.rb#6
class Hashdiff::LcsCompareArrays
  class << self
    # source://hashdiff//lib/hashdiff/lcs_compare_arrays.rb#8
    def call(obj1, obj2, opts = T.unsafe(nil)); end
  end
end

# Used to compare arrays in a linear complexity, which produces longer diffs
# than using the lcs algorithm but is considerably faster
#
# @private
#
# source://hashdiff//lib/hashdiff/linear_compare_array.rb#8
class Hashdiff::LinearCompareArray
  # @return [LinearCompareArray] a new instance of LinearCompareArray
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#45
  def initialize(old_array, new_array, options); end

  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#14
  def call; end

  private

  # Returns the value of attribute additions.
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#42
  def additions; end

  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#139
  def append_addition(item, index); end

  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#123
  def append_addititions_before_match(match_index); end

  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#144
  def append_deletion(item, index); end

  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#131
  def append_deletions_before_match(match_index); end

  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#149
  def append_differences(difference); end

  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#153
  def changes; end

  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#67
  def compare_at_index; end

  # Returns the value of attribute deletions.
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#42
  def deletions; end

  # Returns the value of attribute differences.
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#42
  def differences; end

  # Returns the value of attribute expected_additions.
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#43
  def expected_additions; end

  # Sets the attribute expected_additions
  #
  # @param value the value to set the attribute expected_additions to.
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#43
  def expected_additions=(_arg0); end

  # @return [Boolean]
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#59
  def extra_items_in_new_array?; end

  # @return [Boolean]
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#55
  def extra_items_in_old_array?; end

  # look ahead in the new array to see if the current item appears later
  # thereby having new items added
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#89
  def index_of_match_after_additions; end

  # look ahead in the old array to see if the current item appears later
  # thereby having items removed
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#107
  def index_of_match_after_deletions; end

  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#82
  def item_difference(old_item, new_item, item_index); end

  # @return [Boolean]
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#63
  def iterated_through_both_arrays?; end

  # Returns the value of attribute new_array.
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#42
  def new_array; end

  # Returns the value of attribute new_index.
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#43
  def new_index; end

  # Sets the attribute new_index
  #
  # @param value the value to set the attribute new_index to.
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#43
  def new_index=(_arg0); end

  # Returns the value of attribute old_array.
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#42
  def old_array; end

  # Returns the value of attribute old_index.
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#43
  def old_index; end

  # Sets the attribute old_index
  #
  # @param value the value to set the attribute old_index to.
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#43
  def old_index=(_arg0); end

  # Returns the value of attribute options.
  #
  # source://hashdiff//lib/hashdiff/linear_compare_array.rb#42
  def options; end

  class << self
    # source://hashdiff//lib/hashdiff/linear_compare_array.rb#9
    def call(old_array, new_array, options = T.unsafe(nil)); end
  end
end

# source://hashdiff//lib/hashdiff/version.rb#4
Hashdiff::VERSION = T.let(T.unsafe(nil), String)

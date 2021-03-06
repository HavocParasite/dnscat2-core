##
# crypto_helper.rb
# Created December, 2015
# By Ron Bowes
#
# See: LICENSE.md
#
# Implements functions that encryptor.rb (packet.rb) need.
##

module Dnscat2
  module Core
    module Libs
      class CryptoHelper
        def CryptoHelper.bignum_to_binary(bn, size: 32)
          if(!bn.is_a?(Bignum) and !bn.is_a?(Fixnum))
            raise(ArgumentError, "Expected: Bignum; received: #{bn.class}")
          end

          return [bn.to_s(16).rjust(size*2, "\0")].pack("H*")
        end

        def CryptoHelper.bignum_to_text(bn, size: 32)
          return CryptoHelper.bignum_to_binary(bn, size: size).unpack("H*").pop()
        end

        def CryptoHelper.binary_to_bignum(binary)
          if(!binary.is_a?(String))
            raise(ArgumentError, "Expected: String; received: #{binary.class}")
          end

          return binary.unpack("H*").pop().to_i(16)
        end
      end
    end
  end
end

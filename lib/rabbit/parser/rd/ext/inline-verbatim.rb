require 'rabbit/utils'
require 'rabbit/parser/rd/ext/base'
require 'rabbit/parser/rd/ext/image'
require 'rabbit/parser/rd/ext/entity'

module Rabbit
  module Ext
    class InlineVerbatim < Base
      extend Utils
      include Image
      include Entity

      def default_ext_inline_verbatim(label, source, content, visitor)
        Verbatim.new(Text.new(source))
      end

#       def ext_inline_verb_img(label, content, visitor)
#         img(label, content, visitor)
#       end
      
      def ext_inline_verb_quote(label, source, content, visitor)
        label = label.to_s
        return nil unless /^quote:(.*)$/ =~ label
        default_ext_inline_verb($1, visitor.apply_to_String($1), $1, visitor)
      end
      
      def ext_inline_verb_del(label, source, content, visitor)
        label = label.to_s
        return nil unless /^del:(.*)$/ =~ label
        DeletedText.new(Text.new(visitor.apply_to_String($1)))
      end
      
      def ext_inline_verb_sub(label, source, content, visitor)
        label = label.to_s
        return nil unless /^sub:(.*)$/ =~ label
        sub_text = $1
        if /\A\s*\z/ =~ sub_text
          sub_text = Text.new(sub_text)
        else
          sub_text = visitor.apply_to_Verb(RD::Verb.new(sub_text))
        end
        Subscript.new(sub_text)
      end
      
      def ext_inline_verb_sup(label, source, content, visitor)
        label = label.to_s
        return nil unless /^sup:(.*)$/ =~ label
        sup_text = $1
        if /\A\s*\z/ =~ sup_text
          sup_text = Text.new(sup_text)
        else
          sup_text = visitor.apply_to_Verb(RD::Verb.new(sup_text))
        end
        Superscript.new(sup_text)
      end

      def ext_inline_verb_note(label, source, content, visitor)
        label = label.to_s
        return nil unless /^note:(.*)$/ =~ label
        Note.new(Text.new(visitor.apply_to_String($1)))
      end

      def ext_inline_verb_lang(label, source, content, visitor)
        label = label.to_s
        return nil unless /^lang:([a-z]{2,2}):(.*)$/ =~ label
        text = Text.new(visitor.apply_to_String($2))
        text.add_default_prop("lang", $1)
        text
      end
    end
  end
end
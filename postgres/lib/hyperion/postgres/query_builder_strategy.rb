module Hyperion
  module Postgres

    class QueryBuilderStrategy
      def quote_tick
        '"'
      end

      def apply_limit_and_offset(sql_query, limit, offset)
        apply_limit(sql_query, limit)
        apply_offset(sql_query, offset)
      end

      private

      def apply_limit(sql_query, limit)
        if limit
          sql_query.append("LIMIT ?", [limit])
        end
      end

      def apply_offset(sql_query, offset)
        if offset
          sql_query.append("OFFSET ?", [offset])
        end
      end
    end

  end
end
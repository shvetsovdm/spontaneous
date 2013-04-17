# encoding: UTF-8

require File.expand_path('../../test_helper', __FILE__)


describe "Page" do
  before do
    @site = setup_site
    Content.delete
    class ::Page
      field :title, :string
      box :sub
    end
  end

  after do
    Object.send(:remove_const, :Page)
    Object.send(:remove_const, :Piece)
    teardown_site
  end

  describe "Root page" do
    it "be created by first page insert" do
      p = Page.create
      assert p.root?
      p.path.must_equal "/"
      p.slug.must_equal ""
      p.parent.must_be_nil
    end

    it "be a singleton" do
      p = Page.create
      assert p.root?
      q = Page.create
      refute q.root?
    end
  end

  describe "Slugs" do
    it "be generated if missing" do
      o = Page.create
      p = Page.create
      p.slug.wont_equal ""
      p.save
      p.reload.slug.wont_equal ""
    end

    it "be made URL safe" do
      o = Page.create
      p = Page.create
      p.slug = " something's illegal and ugly!!"
      p.slug.must_equal "somethings-illegal-and-ugly"
      p.save
      p.reload.slug.must_equal "somethings-illegal-and-ugly"
    end

    it "be set from title if using generated slug" do
      r = Page.create
      slug = Page.generate_default_slug
      Page.stubs(:generate_default_slug).returns(slug)
      o = Page.create(:title => "New Page")
      p = Page.create(:title => "New Page")
      o.slug.must_equal slug
      r.sub << o
      o.save
      o = Page[o.id]
      o.slug.must_equal slug
      o.sub << p
      o.save
      o = Page[o.id]
      o.slug.must_equal slug
      o.title = "New Title"
      o.save
      o.reload
      o.slug.must_equal "new-title"
      o.title = "Another Title"
      o.save
      o.reload
      o.slug.must_equal "new-title"
    end

    it "doesn't set a conflicting url on creation" do
      r = Page.create
      o = Page.create(:title => "New Page")
      r.sub << o
      o.save

      p = Page.create(:title => "New Page")
      r.sub << p
      p.save
      slug_o = o.slug
      slug_p = p.slug
      o.slug.wont_equal p.slug
    end

    it "fixes conflicting slugs automatically" do
      r = Page.create
      o = Page.create(:title => "New Page", :slug => "my-slug")
      r.sub << o
      o.save

      p = Page.create(:title => "New Page")
      r.sub << p
      p.save
      p.slug = "my-slug"
      p.save
      o.slug.wont_equal p.slug
    end

    it "not be longer than 255 chars" do
      o = Page.create
      long_slug = (["bang"]*100)
      o.slug = long_slug.join(' ')
      o.slug.length.must_equal 255
      o.slug.must_equal long_slug.join('-')[0..254]
    end
  end

  describe "Pages in tree" do
    before do
      Content.delete
      @p = Page.create
      assert @p.root?
      @q = Page.new(:slug => 'q')
      @r = Page.new(:slug => 'r')
      @s = Page.new(:slug => 's')
      @t = Page.new(:slug => 't')
      @p.sub << @q
      @q.sub << @r
      @q.sub << @s
      @s.sub << @t
      @p.save
      @q.save
      @r.save
      @s.save
      @t.save
      # doing this means that the == tests work below
      @p = Page[@p.id]
      @q = Page[@q.id]
      @r = Page[@r.id]
      @s = Page[@s.id]
      @t = Page[@t.id]
    end

    it "be able to find a reference to their inline entry" do
      @q.entry.class.must_equal Spontaneous::PagePiece
    end

    it "have a reference to their parent" do
      @p.parent.must_be_nil
      @q.parent.must_equal @p
      @r.parent.must_equal @q
      @s.parent.must_equal @q
      @t.parent.must_equal @s
    end
    it "have a reference to their owner" do
      @p.owner.must_be_nil
      @q.owner.must_equal @p
      @r.owner.must_equal @q
      @s.owner.must_equal @q
      @t.owner.must_equal @s
    end

    it "know their container" do
      @p.container.must_be_nil
      @q.container.must_equal @p.sub
      @r.container.must_equal @q.sub
      @s.container.must_equal @q.sub
      @t.container.must_equal @s.sub
    end

    it "know their containing box" do
      @p.box.must_be_nil
      @q.box.must_equal @p.sub
      @r.box.must_equal @q.sub
      @s.box.must_equal @q.sub
      @t.box.must_equal @s.sub
    end

    it "have a list of their children" do
      @p.children.must_equal [@q]
      @q.children.must_equal [@r, @s]
      @r.children.must_equal []
      @s.children.must_equal [@t]
      @t.children.must_equal []
    end

    it "have a reference to themselves as page" do
      @p.page.must_equal @p
      @q.page.must_equal @q
      @r.page.must_equal @r
      @s.page.must_equal @s
      @t.page.must_equal @t
    end

    it "have a reference to themselves as content_instance" do
      @p.content_instance.must_equal @p
    end

    it "keep track of their depth" do
      @p.depth.must_equal 0
      @q.depth.must_equal 1
      @r.depth.must_equal 2
      @s.depth.must_equal 2
      @t.depth.must_equal 3
    end

    it "have the correct page hierarchy" do
      Page.box :things1
      Page.box :things2
      a = Page.new
      c = Page.new
      d = Page.new
      e = Page.new
      a.things1 << c
      a.things2 << d
      a.things2 << e
      a.save
      a.reload
      c.reload
      d.reload
      e.reload
      c.parent.must_equal a
      d.parent.must_equal a
      e.parent.must_equal a
      c.content_ancestors.must_equal [a, a.things1]
      d.content_ancestors.must_equal [a, a.things2]
      e.content_ancestors.must_equal [a, a.things2]
      # the zeroth box is 'sub'
      c.page_order_string.must_equal "00001.00000"
      d.page_order_string.must_equal "00002.00000"
      e.page_order_string.must_equal "00002.00001"
    end

    it "have the correct page hierarchy for pages within pieces" do
      Page.box :things
      Piece.box :pages
      a = Page.new
      b = Piece.new
      a.things << b
      c = Page.new
      d = Page.new
      b.pages << c
      b.pages << d
      a.save
      a.reload
      b.reload
      c.reload
      d.reload
      c.parent.must_equal a
      c.content_ancestors.must_equal [a, a.things, b, b.pages]
      c.page_order_string.must_equal "00001.00000.00000.00000"
      d.page_order_string.must_equal "00001.00000.00000.00001"
    end

    it "have correct paths" do
      @p.path.must_equal "/"
      @q.path.must_equal "/q"
      @r.path.must_equal "/q/r"
      @s.path.must_equal "/q/s"
      @t.path.must_equal "/q/s/t"
    end

    it "update paths when being adopted" do
      @p.sub.adopt(@s)
      @s.reload
      @t.reload
      @s.path.must_equal "/s"
      @t.path.must_equal "/s/t"
    end

    it "all have a reference to the root node" do
      @p.root.must_equal @p
      @q.root.must_equal @p
      @r.root.must_equal @p
      @s.root.must_equal @p
      @t.root.must_equal @p
    end

    it "have correct ancestor paths" do
      @p.ancestor_path.must_equal []
      @q.ancestor_path.must_equal [@p.id]
      @r.ancestor_path.must_equal [@p.id, @q.id]
      @s.ancestor_path.must_equal [@p.id, @q.id]
      @t.ancestor_path.must_equal [@p.id, @q.id, @s.id]
    end
    it "know their ancestors" do
      # must be a better way to test these arrays
      @p.ancestors.must_equal []
      @q.ancestors.must_equal [@p]
      @r.ancestors.must_equal [@p, @q]
      @s.ancestors.must_equal [@p, @q]
      @t.ancestors.must_equal [@p, @q, @s]
    end

    it "know their generation" do
      @r.generation.must_equal [@r, @s]
      @s.generation.must_equal [@r, @s]
    end

    it "know their siblings" do
      @r.siblings.must_equal [@s]
      @s.siblings.must_equal [@r]
    end

    it "always have the right path" do
      @q.slug = "changed"
      @q.save
      @p.reload.path.must_equal "/"
      @q.reload.path.must_equal "/changed"
      @r.reload.path.must_equal "/changed/#{@r.slug}"
      @s.reload.path.must_equal "/changed/#{@s.slug}"
      @t.reload.path.must_equal "/changed/#{@s.slug}/#{@t.slug}"
    end

    it "have direct access to ancestors at any depth" do
      @q.ancestor(0).must_equal @p
      @r.ancestor(0).must_equal @p
      @r.ancestor(1).must_equal @q
      @s.ancestor(1).must_equal @q
      @t.ancestor(1).must_equal @q
      @t.ancestor(2).must_equal @s
      @t.ancestor(-1).must_equal @s
      @t.ancestor(-2).must_equal @q
    end

    it "test for ancestry" do
      assert @t.ancestor?(@s)
      assert @t.ancestor?(@q)
      assert @t.ancestor?(@p)
      refute @q.ancestor?(@t)
    end

    it "know if it's in the current path" do
      assert @t.active?(@s)
      assert @t.active?(@t)
      assert @t.active?(@q)
      assert @t.active?(@p)
      refute @q.active?(@t)
    end

    it "provide a list of pages at any depth" do
      @t.at_depth(2).must_equal [@r, @s]
      @p.at_depth(1).must_equal [@q]
      lambda { @p.at_depth(2) }.must_raise(ArgumentError)
    end
  end

  describe "page pieces" do
    before do
      Page.box :things
      Piece.box :things
      @parent = Page.create
      @piece = Piece.new
      @child = Page.new
      @parent.things << @piece
      @piece.things << @child
      @parent.save
      @piece.save
      @child.save
      @page_piece = @parent.things.first.things.first
    end

    it "report their depth according to their position in the piece tree" do
      @parent.depth.must_equal 0
      @parent.contents.first.depth.must_equal 1
      @parent.contents.first.contents.first.depth.must_equal 2
    end

    it "know their page" do
      @page_piece.page.must_equal @parent
    end

    it "know their container" do
      @page_piece.container.must_equal @piece.things
    end

    it "know their box" do
      @page_piece.box.must_equal @piece.things
    end

    it "know their parent" do
      @page_piece.parent.must_equal @piece
    end

    it "know their owner" do
      @page_piece.owner.must_equal @piece
    end
  end
end

// Author: SwiftUI-Lab (swiftui-lab.com)
// Description: this learning tool is designed to showcase the different
// Grid and GridRow view options, added in SwiftUI 2022. It is part of the
// blog article: https://swiftui-lab.com/eager-grids
//
import SwiftUI
import UniformTypeIdentifiers

// The root view of the application
//ContentView
struct GridTrainer: View {
    @Environment(\.colorScheme) var scheme
    
    @State var grid = GridData()
    @State var opacityPanelOpacity = 0.5
    
    let inspectorWidth: CGFloat = 330
    
    var body: some View {
                
        GeometryReader { proxy in
            HStack(spacing: 0) {
                GridView()
                    .opacity(grid.gridOpacity)
                    .frame(maxWidth: proxy.size.width - inspectorWidth, maxHeight: proxy.size.height)
                    .background(alignment: .topLeading) {
                        // Grid Code
                        if grid.codeOpacity > 0 {
                            ScrollView {
                                HStack {
                                    Text(CodeGenerator.shared.generateCode(scheme: scheme, grid: grid))
                                        .modifier(SelectabilityModifier(enabled: grid.selectableCode))
                                        .padding(10)
                                        .opacity(grid.codeOpacity)

                                    Spacer()
                                }
                            }
                        }
                    }
                    .background { Color.white }
                    .overlay(alignment: .bottomTrailing) {
                        // Opacity Sliders
                        HStack {
                            Slider(value: $grid.codeOpacity, in: 0...1.0) {
                                Image(systemName: "doc.text")
                            }
                            .padding(10)
                            .frame(width: 150)

                            Slider(value: $grid.gridOpacity, in: 0...1.0) {
                                Image(systemName: "circle.grid.3x3.fill")
                            }
                            .padding(10)
                            .frame(width: 150)
                        }
                        .background { controlBackground }
                        .padding([.trailing, .bottom], 10)
                        .opacity(opacityPanelOpacity)
                        .onHover { isHovering in
                            withAnimation(.quick) {
                                opacityPanelOpacity = isHovering ? 1.0 : 0.5
                            }
                        }
                    }
                    .overlay(alignment: .topTrailing) {
                        // Copy Button
                        Button {
                            copyCode()
                        } label: {
                            Image(systemName: "doc.on.clipboard.fill")
                                .font(.system(size: 18))
                                .padding(10)
                                .background { controlBackground }
                        }
                        .padding(30)
                        .buttonStyle(.borderless)
                        .tint(.accentColor)
                    }
                
                // Right-side inspector panel
                Inspector()
                    .scrollContentBackground(.hidden)
                    .background {
                        #if os(macOS)
                        Rectangle().fill(Color(nsColor: NSColor.controlBackgroundColor))
                        #else
                        Rectangle().fill(Color(uiColor: UIColor.tertiarySystemGroupedBackground))
                        #endif
                    }
                    .frame(width: inspectorWidth)
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .environmentObject(grid)
        
    }
    
    @ViewBuilder var controlBackground: some View {
        if scheme == .dark {
            RoundedRectangle(cornerRadius: 5.0).fill(.white.opacity(0.1))
        } else {
            RoundedRectangle(cornerRadius: 5.0).fill(.black.opacity(0.1))
        }
    }
    
    func copyCode() {
        let nsAttributedString = NSAttributedString(CodeGenerator.shared.code)

        let documentAttributes = [NSAttributedString.DocumentAttributeKey.documentType: NSAttributedString.DocumentType.rtf]
        let rtfData = try! nsAttributedString.data(from: NSMakeRange(0, nsAttributedString.length), documentAttributes: documentAttributes)
        
        #if os(macOS)
        let pb = NSPasteboard.general
        pb.clearContents()
        pb.setData(rtfData, forType: .rtf)
        #else
        let pb = UIPasteboard.general
        pb.setData(rtfData, forPasteboardType: UTType.rtf.identifier)
        #endif
    }
}

// To prevent the I-Beam text cursor when the mouse pointer is over the grid,
// we disable text selectability when we are hovering it.
struct SelectabilityModifier: ViewModifier {
    let enabled: Bool
    
    func body(content: Content) -> some View {
        if enabled {
            content.textSelection(.enabled)
        } else {
            content.textSelection(.disabled)
        }
    }
}

// The view that composes the grid
struct GridView: View {
    @EnvironmentObject var grid: GridData
    
    var body: some View {
        Grid(alignment: grid.alignemntOption.alignment,
             horizontalSpacing: grid.hSpacing,
             verticalSpacing: grid.vSpacing) {
            
            ForEach($grid.rows) { $row in
                GridRow(alignment: row.alignmentOption != .unspecified ? row.alignmentOption.alignment : nil) {
                    ForEach($row.cells) { $cell in
                        CellView(row: $row, cell: $cell)
                    }
                }
            }
        }
        .padding(grid.padding)
        .border(.primary)
        .onHover { isHovering in
            if isHovering {
                grid.selectableCode = false
            } else {
                grid.selectableCode = true
            }
        }
    }
}

// A configurable view to use with each cell in the grid
struct CellView: View {
    @EnvironmentObject var grid: GridData

    @Binding var row: Row
    @Binding var cell: Cell

    var body: some View {
        
        RoundedRectangle(cornerRadius: 5.0)
            .fill(cell.color.gradient)
            .frame(width: cell.flex.axisSet.flexWidth ? nil : cell.width, height: cell.flex.axisSet.flexHeight ? nil : cell.height)
            .modifier(ColumnAlignmentModifier(cell: cell))
            .gridCellColumns(cell.span)
            .modifier(AlignmentModifier(cell: cell))
            .overlay {
                selectionOverlay(cell: cell)
            }
            .overlay {
                if grid.showProperties {
                    textOverlay(cell: cell)
                }
            }
            .gridCellUnsizedAxes(cell.unsized.axisSet)
            .onTapGesture {
                grid.cellSelection(.toggle, cell: $cell)
            }
            .contextMenu {
                contextMenu(row: $row, cell: $cell)
            }
    }
    
    @ViewBuilder func selectionOverlay(cell: Cell) -> some View {
        let lineStyle = StrokeStyle(lineWidth: 1.0,
                                    lineCap: .round,
                                    lineJoin: .miter,
                                    dash: [5, 5],
                                    dashPhase: cell.selectionAnimation ? 0 : 10)
        
        if cell.selected {
            RoundedRectangle(cornerRadius: 5.0).stroke(style: lineStyle).foregroundColor(.primary)
        } else {
            EmptyView()
        }
    }
    
    func textOverlay(cell: Cell) -> some View {
        VStack {
            if cell.alignmentOption != .unspecified {
                Text(cell.alignmentOption.shortName)
            }
            
            if cell.span > 1 {
                Text("span = \(cell.span)")
            }
            
            if cell.flex.axisSet.contains([.vertical, .horizontal]) {
                Text("flex W+H")
            } else if cell.flex == .vertical {
                Text("flex H")
            } else if cell.flex == .horizontal {
                Text("flex W")
            }
            
            if cell.unsized != .unspecified {
                switch cell.unsized {
                case .unspecified: Text("")
                case .horizontal: Text("unsize(H)")
                case .vertical: Text("unsize(V)")
                case .both: Text("unsize(H+V)")
                }
            }
        }
        .font(.caption)
        .foregroundColor(.black)
    }

    @ViewBuilder func contextMenu(row: Binding<Row>, cell: Binding<Cell>) -> some View {
        
        Group {
            Button("Select Cell") { grid.cellSelection(.select, cell: cell) }
            Button("Select Row") { grid.rowSelection(.select, row: row) }
            Button("Select All") { grid.selectAll() }
            Divider()
            Button("Deselect Cell") { grid.cellSelection(.deselect, cell: cell) }
            Button("Deselect Row") { grid.rowSelection(.deselect, row: row) }
            Button("Deselect All") { grid.deselectAll() }
            Divider()
        }
        Group {
            Button("Remove Selected Cells") { withAnimation(.quick) { grid.removeSelectedCells() } }
            Button("Remove Cell") { withAnimation(.quick) { grid.removeCell(cell) } }
            Button("Remove Row") { withAnimation(.quick) { grid.removeRow(row) } }
            
            if let (rowIdx, cellIdx) = grid.getCellIndex(cell: cell.wrappedValue) {
                Divider()
                Button("Add Row Before") { withAnimation(.quick) { grid.addRow(.before(rowIdx)) } }
                Button("Add Row After") { withAnimation(.quick) { grid.addRow(.after(rowIdx)) } }
                Button("Add Cell Before") { withAnimation(.quick) { grid.addCell(rowIdx: rowIdx, .before(cellIdx)) } }
                Button("Add Cell After") { withAnimation(.quick) { grid.addCell(rowIdx: rowIdx, .after(cellIdx)) } }
                Divider()
                Button("Add First Column") { withAnimation(.quick) { grid.addCol(true) } }
                Button("Add Last Column") { withAnimation(.quick) { grid.addCol(false) } }
            }
        }
    }

    struct AnimatedAlignmentModifier: ViewModifier {
        @EnvironmentObject var grid: GridData
        
        let cell: Cell
        
        func body(content: Content) -> some View {
            
            var alignmentOption = cell.alignmentOption
            
            if cell.alignmentOption == .unspecified {
                if let (rowIdx, _) = grid.getCellIndex(cell: cell) {
                    let row = grid.rows[rowIdx]

                    alignmentOption = grid.alignemntOption.mergeWithVerticalAlignment(row.alignmentOption)
                }
            }

            return content.gridCellAnchor(alignmentOption.unitPoint)
        }
    }
    
    struct ColumnAlignmentModifier: ViewModifier {
        let cell: Cell
        
        @ViewBuilder func body(content: Content) -> some View {
                        
            if cell.colAlignmentOption == .unspecified {
                content
            } else {
                content.gridColumnAlignment(cell.colAlignmentOption.alignment ?? .center)
            }

        }
    }

    struct AlignmentModifier: ViewModifier {
        let cell: Cell
        
        @ViewBuilder func body(content: Content) -> some View {
                        
            if cell.alignmentOption == .unspecified {
                content
            } else {
                content.gridCellAnchor(cell.alignmentOption.unitPoint)
            }

        }
    }
}

// The right-handed inspector panel, used to select grid options
struct Inspector: View {
    @EnvironmentObject var grid: GridData
    
    @State var showGridSectionHelp = false
    @State var showRowSectionHelp = false
    @State var showCellSectionHelp = false
    
    var body: some View {
        
        let anim_row_sources: [Binding<Row>] = $grid.rows.animation(.quick).map { $0 }.filter { $0.wrappedValue.cells.first { $0.selected } != nil }
        let anim_col_sources: [Binding<Cell>] = $grid.rows.animation(.quick).flatMap { $0.cells }.filter({ $0.wrappedValue.selected })
        
        let row_sources: [Binding<Row>] = $grid.rows.map { $0 }.filter { $0.wrappedValue.cells.first { $0.selected } != nil }
        let col_sources: [Binding<Cell>] = $grid.rows.flatMap { $0.cells }.filter({ $0.wrappedValue.selected })
        
        let disableFlexWidth = col_sources.filter({ !$0.wrappedValue.flex.axisSet.flexWidth != true }).count > 0
        let disableFlexHeight = col_sources.filter({ !$0.wrappedValue.flex.axisSet.flexHeight != true }).count > 0
        
        Form {
            Section {
                Picker("Alignment", selection: $grid.alignemntOption.animation(.quick)) {
                    ForEach(AlignmentOption.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                
                Toggle("Show Cell Properties", isOn: $grid.showProperties.animation(.quick))
                
                VStack(alignment: .leading) {
                    Text("Horizontal Spacing = \(String(format: "%.1f", grid.hSpacing))")
                    
                    CustomSlider(value: $grid.hSpacing, range: 0...50, updating: $grid.updating)
                }
                
                VStack(alignment: .leading) {
                    Text("Vertical Spacing = \(String(format: "%.1f", grid.vSpacing))")
                    
                    CustomSlider(value: $grid.vSpacing, range: 0...50, updating: $grid.updating)
                }
                
                VStack(alignment: .leading) {
                    Text("Grid Padding = \(String(format: "%.1f", grid.padding))")
                    
                    CustomSlider(value: $grid.padding, range: 0...50, updating: $grid.updating)
                }
            } header: {
                HStack {
                    Text("Grid Options")
                    
                    Button {
                        showGridSectionHelp.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                        
                    }
                    .buttonStyle(.borderless)
                    .popover(isPresented: $showGridSectionHelp) { HelpGridSection() }
                }
            }
            
            
            if grid.selectedRows.count > 0 {
                
                Section {
                    let mixed = Set(row_sources.map { $0.wrappedValue.alignmentOption }).count > 1
                    
                    Picker("Row Alignment \(mixed ? "⚠️" : "")", sources: anim_row_sources, selection: \.alignmentOption) {
                        ForEach(VerticalAlignmentOption.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                } header: {
                    HStack {
                        Text("Selected Row Options")
                        Button {
                            showRowSectionHelp.toggle()
                        } label: {
                            Image(systemName: "info.circle.fill")
                            
                        }
                        .buttonStyle(.borderless)
                        .popover(isPresented: $showRowSectionHelp) { HelpRowSection() }
                    }
                }
                
                if col_sources.count > 0 {
                    
                    Section {
                        let mixedColAlignments = Set(col_sources.map { $0.wrappedValue.colAlignmentOption }).count > 1
                        let mixedAlignments = Set(col_sources.map { $0.wrappedValue.alignmentOption }).count > 1
                        let mixedSpans = Set(col_sources.map { $0.wrappedValue.span }).count > 1
                        let mixedFlex = Set(col_sources.map { $0.wrappedValue.flex }).count > 1
                        let mixedUnsized = Set(col_sources.map { $0.wrappedValue.unsized }).count > 1

                        Picker("Column Alignment \(mixedColAlignments ? "⚠️" : "")", sources: anim_col_sources, selection: \.colAlignmentOption) {
                            ForEach(HorizontalAlignmentOption.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }

                        Picker("Cell Alignment \(mixedAlignments ? "⚠️" : "")", sources: anim_col_sources, selection: \.alignmentOption) {
                            ForEach(AlignmentOption.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        
                        Picker("Cell Span \(mixedSpans ? "⚠️" : "")", sources: anim_col_sources, selection: \.span) {
                            Text("unspecified").tag(1)
                            Text("2").tag(2)
                            Text("3").tag(3)
                            Text("4").tag(4)
                            Text("5").tag(5)
                            Text("6").tag(6)
                        }
                        
                        Picker("Frame \(mixedFlex ? "⚠️" : "")", sources: anim_col_sources, selection: \.flex) {
                            ForEach(FlexOption.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        
                        Picker("Unsized \(mixedUnsized ? "⚠️" : "")", sources: anim_col_sources, selection: \.unsized) {
                            ForEach(UnsizedOption.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Width")
                            SpringLoadedSlider(sources: col_sources, selection: \.width, range: 10...800, updating: $grid.updating)
                        }
                        .disabled(disableFlexWidth)
                        
                        VStack(alignment: .leading) {
                            Text("Height")
                            SpringLoadedSlider(sources: col_sources, selection: \.height, range: 10...800, updating: $grid.updating)
                        }
                        .disabled(disableFlexHeight)
                        
                    } header: {
                        HStack {
                            Text("Selected Cell Options")
                            
                            Button {
                                showCellSectionHelp.toggle()
                            } label: {
                                Image(systemName: "info.circle.fill")
                                
                            }
                            .buttonStyle(.borderless)
                            .popover(isPresented: $showCellSectionHelp) { HelpCellSection() }
                        }
                    }
                }
                
            }

            HStack {
                #if os(macOS)
                let infoText = Text("Individual cells can be selected with a single click.\nUse right-click for more options.")
                #else
                let infoText = Text("Individual cells can be selected with a single tap.\nUse long-press for more options.")
                #endif
                
                infoText
                    .font(.caption2)
                    .multilineTextAlignment(.center)
            }
            .frame(maxWidth: .infinity)
            
        }
        .formStyle(.grouped)
    }
}

struct HelpGridSection: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            Text("""
                    The selected **Alignment** affects all cells in the grid, unless a cell
                    specifies its own alignment. Additionally, if a row alignment is selected,
                    the vertical component of this alignment will be ignored in such rows.
                 """)
            
            Text("""
                    The **Show Cell Properties** will overlay a text with the cell selected
                    options (if any).
                 """)

            Text("""
                    You may also select the inter cell **Vertical Spacing** and **Horizontal Spacing**
                 """)

            Text("""
                    The **Padding** option, although not technically part of the grid, is included
                    here, because it may be a common requiremet to have a space between
                    the cells and its drawn border. See the generated code to see how the
                    padding is added.
                 """)
        }
        .padding(20)
        .font(.system(size: 14.0))
    }
}

struct HelpRowSection: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            Text("""
                    The properties in this section affect all selected rows. A row
                    is considered selected, if at least one of its cells is selected.
                 """)
            
            Text("""
                    The **Row Alignment** from this section, sets the vertical alignment of
                    the cells of the selected rows, overriding the vertical component of
                    the grid's alignment. However, the value is ignored for cells that
                    specified their own alignment.
                 """)
        }
        .padding(20)
        .font(.system(size: 14.0))
    }
}

struct HelpCellSection: View {
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            Text("""
                    The properties in this section affect all selected cells. A
                    yellow warning icon indicates that the option has different
                    values for the selected cells.
                 """)
            
            Text("""
                    The **Column Alignment** specifies a horizontal alignment for all
                    the cells in the columns of the selected cells. **WARNING**: You
                    should only set column alignment in one cell per column, otherwise,
                    behavior is undefined.
                 """)

            Text("""
                    The **Alignment** affects the selected cells only, overriding any
                    grid, column or row alignment.
                 """)

            Text("""
                    You may select a **Span** for each selected cell.
                 """)
            
            Text("""
                    The **Frame** picker let you indicate if the rectangles in the
                    selected cells have a fixed size (modifiable with the sliders),
                    or if they expand to take as much space as there is available.
                    This is affected by the next option (unsized)
                 """)
            
            Text("""
                    Cells can be configured to not ask for extra space (**Unsized**). That is,
                    the cell will take as much space as needed (if it wants to), but the
                    grid will not grow to provide more space. Note that this option
                    indicates that the view should not make the grid grow. That is,
                    selecting horizontal, it means the grid will not grow horizontally,
                    but will grow vertically (if required).
                 """)
            
        }
        .padding(20)
        .font(.system(size: 14.0))

    }
}


// A custom Slider. Instead of using the system provided Slider,
// we use this custome control, which matches the style of the SpringLoadedSlider,
// used to adjust the width and height of cells.
struct CustomSlider: View {
    let knobSize: CGSize = CGSize(width: 20, height: 20)
    
    @GestureState(reset: resetGesture) private var offset: CGPoint?
    @State var sliderWidth: CGFloat = 1
    
    // View parameters
    @Binding var value: CGFloat
    let range: ClosedRange<CGFloat>
    @Binding var updating: Bool // used to suspend code generation while the slide is being used

    // Computed properites
    var moved: CGFloat { max(min(offset?.x ?? 0, sliderWidth / 2.0), -sliderWidth / 2.0) }
    
    var body: some View {
        let drag = DragGesture(minimumDistance: 0)
            .updating($offset) { val, state, transaction in
                state = val.location
                
                if let pos = state?.x {
                    self.value = positionToValue(pos: pos)
                }
                
                // Only update once at the start of gesture
                if !updating {
                    // suspends code generation while using the slider (for performance)
                    updating = true
                }
            }
            .onEnded { _ in
                // resume code generation
                updating = false
            }

        ZStack {
            HStack(spacing: 0) {
                RoundedRectangle(cornerRadius: 2.5) // green line
                    .fill(.green)
                    .frame(width: valueToPosition(), height: 6.0)

                RoundedRectangle(cornerRadius: 2.5) // gray line
                    .fill(.gray)
                    .frame(height: 3.0)
            }
            
            RoundedRectangle(cornerRadius: 5.0) // knob
                .fill(.yellow)
                .frame(width: knobSize.width, height: knobSize.height)
                .offset(x: valueToPosition() - sliderWidth / 2.0)
        }
        .contentShape(Rectangle())
        .gesture(drag)
        .background {
            GeometryReader { proxy in
                setSliderWidth(width: proxy.size.width)
            }
        }
    }
    
    // Converts a knob position, into a slider value
    func positionToValue(pos: CGFloat) -> CGFloat {
        let position = min(max(pos, knobSize.width / 2.0), sliderWidth - knobSize.width / 2.0) - (knobSize.width / 2.0)
        let distance = (sliderWidth - knobSize.width)
        let pct = position/distance

        return (range.upperBound - range.lowerBound) * pct + range.lowerBound
    }
    
    // Converts a slider value, into a knob position
    func valueToPosition() -> CGFloat {
        let distance = (sliderWidth - knobSize.width)

        let rangeSize = range.upperBound - range.lowerBound
        let position = ((value - range.lowerBound) / rangeSize) * distance + (knobSize.width / 2.0)
                
        return position
    }
    
    // not elegant, but works in this scenario
    func setSliderWidth(width: CGFloat) -> Color {
        DispatchQueue.main.async {
            sliderWidth = width
        }
        return Color.clear
    }

    // Animates the knob when it gets let go
    static func resetGesture(size: CGPoint?, transaction: inout Transaction) {
        transaction = Transaction(animation: .quick)
    }

}

// A slider that increments a value when the slider is moved to the right,
// and decrements the value when it is moved to the left.
// The further the movement, the quicker the value update.
// When the user lets go, the knob returns to its neutral position.
struct SpringLoadedSlider<C>: View where C : RandomAccessCollection {
    @Environment(\.isEnabled) var isEnabled
    
    @GestureState(reset: resetGesture) private var offset: CGSize?
    @State var sliderWidth: CGFloat = 1
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    // View parameters
    let sources: C
    let selection: KeyPath<C.Element, Binding<CGFloat>>
    let range: ClosedRange<CGFloat>
    @Binding var updating: Bool
    
    // Computed properites
    var moved: CGFloat { max(min(offset?.width ?? 0, sliderWidth / 2.0), -sliderWidth / 2.0) }
    var pct: CGFloat { moved / sliderWidth / 2.0 }
    
    var body: some View {
        let drag = DragGesture()
            .updating($offset) { value, state, transaction in
                if isEnabled {
                    state = value.translation
                }
                
                // Only update once at the start of gesture
                if !updating {
                    DispatchQueue.main.async {
                        // Start timer
                        timer = Timer.publish(every: 0.03, on: .main, in: .common).autoconnect()
                        
                        // suspends code generation while using the slider (for performance)
                        updating = true
                    }
                }
                
            }
            .onEnded { _ in
                // stop the timer, we no longer needed
                timer.upstream.connect().cancel()
                
                // resume code generation
                updating = false
            }
        
        ZStack {
            RoundedRectangle(cornerRadius: 2.5) // gray line
                .fill(.gray)
                .frame(height: 3.0)
            
            RoundedRectangle(cornerRadius: 2.5) // green line
                .fill(.green)
                .frame(width: abs(moved), height: 6.0)
                .offset(x: moved / 2)
            
            RoundedRectangle(cornerRadius: 5.0) // knob
                .fill(isEnabled ? .yellow : .gray)
                .frame(width: 20, height: 20)
                .offset(x: moved)
                .gesture(drag)
        }
        .background {
            GeometryReader { proxy in
                setSliderWidth(width: proxy.size.width)
            }
        }
        .onReceive(timer) { _ in
            if pct != 0 {
                for value in sources {
                    let newVal = min(max(value[keyPath: selection].wrappedValue + pct * 25 , range.lowerBound), range.upperBound)
                    
                    value[keyPath: selection].wrappedValue = newVal
                }
            }
        }
        .compositingGroup() // merges opacity of the knob and the lines
        .opacity(isEnabled ? 1 : 0.3)
        .onAppear {
            // we don't need the timer all the time, only
            // when interacting with the slider
            timer.upstream.connect().cancel()
        }
    }
    
    // not elegant, but works for this scenario
    func setSliderWidth(width: CGFloat) -> Color {
        DispatchQueue.main.async {
            sliderWidth = width
        }
        return Color.clear
    }
    
    static func resetGesture(size: CGSize?, transaction: inout Transaction) {
        // animate knob when it gets let go
        transaction = Transaction(animation: .quick)
    }
    
}

// A class used to generate the grid's code as an AttributedString
// The attributed string can later be used in a Text() view,
// and can also be used to copy to pasteboard
class CodeGenerator {
    
    // The last generated code, displayed while the code generation is suspended
    // due to slider interaction
    var code: AttributedString = AttributedString("")
    
    static var shared = CodeGenerator()
    
    init() { }
    
    // Generate grid code
    func generateCode(scheme: ColorScheme, grid: GridData) -> AttributedString {
        let colors = CodeColors(scheme: scheme)

        if grid.updating {
            return code
        }
        
        var txt = AttributedString("")

        // Grid()
        var gridParams = [CodeParameter]()
        
        if grid.alignemntOption != .unspecified {
            gridParams.append(CodeParameter(param: "alignment", argument: .enum(grid.alignemntOption.rawValue)))
        }
        gridParams.append(contentsOf: [
            CodeParameter(param: "horizontalSpacing", argument: .float(grid.hSpacing)),
            CodeParameter(param: "verticalSpacing", argument: .float(grid.vSpacing))
        ])
               
        txt += .type(colors, name: "Grid", parameters: gridParams) + .space + .openBrackets(colors) + .newLine

        
        for row in grid.rows {
            // Start Row
            var rowParams = [CodeParameter]()
            
            if row.alignmentOption != .unspecified {
                rowParams.append(CodeParameter(param: "alignment", argument: .enum(row.alignmentOption.rawValue)))
            }
            
            txt += .type(colors, indentation: 2, name: "GridRow", parameters: rowParams) + .space + .openBrackets(colors) + .newLine
            
            for cell in row.cells {
                // Start Column
                
                // corner radius
                let rectParams = [CodeParameter(param: "cornerRadius", argument: .float(5))]
                txt += .type(colors, indentation: 4, name: "RoundedRectangle", parameters: rectParams) + .newLine
                
                // fill
                let fillParams = [CodeParameter(argument: .attributed(cell.colorCode(colors)))]
                txt += .function(colors, indentation: 6, name: "fill", parameters: fillParams) + .newLine
                
                // Cell frame
                if cell.flex != .both {
                    var frameParams = [CodeParameter]()
                    
                    if cell.flex == .fixed || cell.flex == .vertical {
                        frameParams.append(CodeParameter(param: "width", argument: .float(cell.width)))
                    }

                    if cell.flex == .fixed || cell.flex == .horizontal {
                        frameParams.append(CodeParameter(param: "height", argument: .float(cell.height)))
                    }
                    
                    txt += .function(colors, indentation: 6, name: "frame", parameters: frameParams) + .newLine
                }
                
                if cell.colAlignmentOption != .unspecified {
                    txt += .function(colors, indentation: 6, name: "gridColumnAlignment", parameters: [CodeParameter(argument: .enum(cell.colAlignmentOption.rawValue))]) + .newLine
                }
                
                if cell.span > 1 {
                    txt += .function(colors, indentation: 6, name: "gridCellColumns", parameters: [CodeParameter(argument: .integer(cell.span))]) + .newLine
                }
                
                if cell.alignmentOption != .unspecified {
                    txt += .function(colors, indentation: 6, name: "gridCellAnchor", parameters: [CodeParameter(argument: .enum(cell.alignmentOption.rawValue))]) + .newLine
                }
                
                if cell.unsized != .unspecified {
                    txt += .function(colors, indentation: 6, name: "gridCellUnsizedAxes", parameters: [CodeParameter(argument: .attributed(cell.unsized.code(colors)))]) + .newLine
                }
                
                // End Column
                if cell.id != row.cells.last?.id {
                    txt += .newLine
                }
            }
            
            // End Row
            txt += .indentation(2) + .closeBrackets(colors) + .newLine

            if row.id != grid.rows.last?.id {
                txt += .newLine
            }

        }
        
        // End Grid
        txt += .closeBrackets(colors) + .newLine

        txt += .function(colors, name: "padding", parameters: [CodeParameter(argument: .float(grid.padding))]) + .newLine
        txt += .function(colors, name: "border", parameters: [CodeParameter(argument: .enum("primary"))]) + .newLine

        code = txt

        return code
    }
}

// A type used for code generation of a function/type parameter
struct CodeParameter {
    enum Argument {
        case `enum`(String)
        case integer(Int)
        case float(Double)
        case variable(String)
        case attributed(AttributedString)
        
        func attributedString(_ colors: CodeColors) -> AttributedString {
            switch self {
            case .enum(let string):
                return .dot(colors) + AttributedString(string, colors.enum)
            case .integer(let value):
                return AttributedString("\(value)", colors.number)
            case .float(let value):
                return AttributedString(String(format: "%.1f", value), colors.number)
            case .variable(let string):
                return AttributedString(string, colors.variable)
            case .attributed(let astr):
                return astr
            }
        }

    }
    
    var param: String? = nil
    let argument: Argument
    
    func attributedString(_ colors: CodeColors) -> AttributedString {
        if let param {
            return AttributedString(param, colors.param) + .colon(colors) + .space + argument.attributedString(colors)
        } else {
            return argument.attributedString(colors)
        }
    }
}

// The set of Code colors both for dark and light schemes
class CodeColors {
    let scheme: ColorScheme
    
    init(scheme: ColorScheme) {
        self.scheme = scheme
    }
    
    var punctuation: Color { .primary }
    var number: Color { scheme == .dark ? Color(hex: "D0BF69") : .red }
    var variable: Color { .primary }
    var keyword: Color { scheme == .dark ? Color(hex: "FC5FA3") : Color(hex: "9B2393") }
    var function: Color { scheme == .dark ? Color(hex: "67B7A4") : Color(hex: "326D74") }
    var param: Color { scheme == .dark ? Color(hex: "A167E6") : Color(hex: "3900A0") }
    var type: Color { scheme == .dark ? Color(hex: "D0A8FF") : Color(hex: "6C36A9") }
    var `enum`: Color { scheme == .dark ? Color(hex: "A167E6") : Color(hex: "3900A0") }
    var constant: Color { scheme == .dark ? Color(hex: "D0BF69") : .red }
}

// A convenience initializer, used by `CodeGeneration`.
extension AttributedString {
    init(_ string: String, _ color: Color) {
        
        #if os(macOS)
        let colorObj = NSColor(color) as Any
        let fontObj = NSFont(name: "Menlo", size: 16.0)
        #else
        let colorObj = UIColor(color) as Any
        let fontObj = UIFont(name: "Menlo", size: 16.0)
    #endif
        
        self.init(string, attributes: .init([
            NSAttributedString.Key.foregroundColor: (colorObj),
            NSAttributedString.Key.font: fontObj as Any
        ]))
    }
}

// Convenience static properties, used for code generation
extension AttributedString {
    static func openSquare(_ colors: CodeColors) -> AttributedString { AttributedString("[", colors.punctuation) }
    static func closeSquare(_ colors: CodeColors) -> AttributedString { AttributedString("]", colors.punctuation) }
    static func openParenthesis(_ colors: CodeColors) -> AttributedString { AttributedString("(", colors.punctuation) }
    static func closeParenthesis(_ colors: CodeColors) -> AttributedString { AttributedString(")", colors.punctuation) }
    static func openBrackets(_ colors: CodeColors) -> AttributedString { AttributedString("{", colors.punctuation) }
    static func closeBrackets(_ colors: CodeColors) -> AttributedString { AttributedString("}", colors.punctuation) }
    static func dot(_ colors: CodeColors) -> AttributedString { AttributedString(".", colors.punctuation) }
    static func colon(_ colors: CodeColors) -> AttributedString { AttributedString(":", colors.punctuation) }
    static func comma(_ colors: CodeColors) -> AttributedString { AttributedString(", ", colors.punctuation) }

    static var newLine = AttributedString("\n", Color.primary)
    static var space = AttributedString(" ", Color.primary)
    
    static func indentation(_ count: Int) -> AttributedString {
        AttributedString(String(repeating: " ", count: count), Color.primary)
    }


    static func type(_ colors: CodeColors, indentation: Int = 0, name: String, parameters: [CodeParameter]) -> AttributedString {
        statement(colors, indentation: indentation, name: name, parameters: parameters, color: colors.type)
    }
    
    static func function(_ colors: CodeColors, indentation: Int = 0, name: String, parameters: [CodeParameter], dot: Bool = true) -> AttributedString
    {
        statement(colors, indentation: indentation, name: name, parameters: parameters, color: colors.function, dot: dot)
    }
    
    static func statement(_ colors: CodeColors, indentation: Int = 0, name: String, parameters: [CodeParameter], color: Color, dot: Bool = false) -> AttributedString {
        var txt = AttributedString()
        
        if indentation > 0 {
            txt += .indentation(indentation)
        }
        
        if dot {
            txt += .dot(colors)
        }
        
        txt += AttributedString(name, color)
        
        guard parameters.count > 0 else { return txt }
        
        txt += .openParenthesis(colors)
        
        for (k, param) in parameters.enumerated() {
            txt += param.attributedString(colors)
            
            if k + 1 != parameters.count {
                txt += .comma(colors)
            }
        }
        
        txt += .closeParenthesis(colors)
        
        return txt
    }
    
}


extension Axis.Set {
    var flexWidth: Bool { self.contains(.horizontal) }
    var flexHeight: Bool { self.contains(.vertical) }
}

// A computed property that returns the name of the color,
// used in `CodeGeneration`.
extension Color {
    var colorName: String {
        switch self {
        case .yellow: return "yellow"
        case .orange: return "orange"
        case .red: return "red"
        case .purple: return "purple"
        case .blue: return "blue"
        case .green: return "green"
        default: return "primary"
        }
    }
}

// An animation used everywhere a quick animation is needed
extension Animation {
    static var quick = Animation.spring()
}

// A convenience initializer used to create colors with a Hex string
// Do not include the leading # symbol.
extension Color {
    init(hex: String) {
        guard hex.count == 6 else { self.init(white: 0.5); return }
        
        let rHex = hex[..<hex.index(hex.startIndex, offsetBy: 2)]
        let gHex = hex[hex.index(hex.startIndex, offsetBy: 2)..<hex.index(hex.startIndex, offsetBy: 4)]
        let bHex = hex[hex.index(hex.startIndex, offsetBy: 4)...]

        let red = Double(Int(rHex, radix: 16) ?? 0)/255
        let green = Double(Int(gHex, radix: 16) ?? 0)/255
        let blue = Double(Int(bHex, radix: 16) ?? 0)/255
        
        self.init(red: red, green: green, blue: blue)
    }
}

// A type used to store the row options and its cells
struct Row: Identifiable {
    let id = UUID()
    
    var alignmentOption: VerticalAlignmentOption = .unspecified
    var cells: [Cell]
}

//A type used to store the cell options
struct Cell: Identifiable {
    let id = UUID()
    
    var color: Color = .red
    var width: CGFloat = 80
    var height: CGFloat = 80
    var flex: FlexOption = .fixed
    var colAlignmentOption: HorizontalAlignmentOption = .unspecified
    var alignmentOption: AlignmentOption = .unspecified
    var span: Int = 1
    var selected: Bool = false
    var selectionAnimation: Bool = false
    var unsized: UnsizedOption = .unspecified
    
    func colorCode(_ colors: CodeColors) -> AttributedString {
        let colorname = color.colorName
        
        return .dot(colors) + AttributedString(colorname, colors.enum) + .dot(colors) + AttributedString("gradient", colors.enum)
    }
}

// An observable object used to store the grid data and some UI values
@Observable
class GridData: ObservableObject {
    static let colors: [Color] = [.green, .yellow, .orange, .red, .purple, .blue]

    // Properties for the UI
     var updating = false
     var selectableCode = false
     var gridOpacity: Double = 1.0
     var codeOpacity: Double = 1.0
    
    // Grid Options
     var alignemntOption: AlignmentOption = .unspecified
     var showProperties = true
     var vSpacing: CGFloat = 5.0
     var hSpacing: CGFloat = 5.0
     var padding: CGFloat = 10.0
    

    // The collection of rows and cells
     var rows: [Row] = {
        var array = [Row]()
        
        for r in 0..<3 {
            var row = Row(cells: [])
            
            for c in 0..<6 {
                row.cells.append(Cell(color: GridData.colors[c % GridData.colors.count]))
            }
            
            array.append(row)
        }
        
        return array
    }()
        
    // Returns the number of selected rows
    var selectedRows: [Int] {
        rows.enumerated().compactMap { (k, row) in
            if row.cells.first(where: { col in col.selected }) != nil {
                return k
            } else {
                return nil
            }
        }
    }
    
    // Selects/Deselects/Toggles Cells
    func cellSelection(_ operation: SelectOperation, cell: Binding<Cell>) {
        let isSelected = cell.wrappedValue.selected
        
        cell.wrappedValue.selected = operation.change(isSelected)
        
        // Only animate selection, not deselection
        if operation == .deselect || (operation == .toggle && isSelected) {
            cell.wrappedValue.selectionAnimation.toggle()
        } else {
            withAnimation(.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                cell.wrappedValue.selectionAnimation.toggle()
            }
        }
    }

    // Selects/Deselects/Toggles a Row
    func rowSelection(_ operation: SelectOperation, row: Binding<Row>) {
        for c in row.cells {
            cellSelection(operation, cell: c)
        }
    }
    
    // Selects All Cells
    func selectAll() {
        for r in 0..<rows.count {
            for c in 0..<rows[r].cells.count {
                rows[r].cells[c].selected = true
                
                withAnimation(.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                    rows[r].cells[c].selectionAnimation.toggle()
                }
            }
        }
    }
    
    // Deselects All Cells
    func deselectAll() {
        for r in 0..<rows.count {
            for c in 0..<rows[r].cells.count {
                rows[r].cells[c].selected = false
                
                rows[r].cells[c].selectionAnimation.toggle()
            }
        }
    }
    
    // Removes a Cell
    func removeCell(_ cell: Binding<Cell>) {
        if let (rowIdx, cellIdx) = getCellIndex(cell: cell.wrappedValue) {
            rows[rowIdx].cells.remove(at: cellIdx)
        }
        
        removeEmptyRows()
    }
    
    // Removes a Row
    func removeRow(_ row: Binding<Row>) {
        if let rowIdx = rows.firstIndex(where: { $0.id == row.id }) {
            rows.remove(at: rowIdx)
        }
    }

    // Removes selected Cells
    func removeSelectedCells() {
        for r in 0..<rows.count {
            let offsets: [Int] = rows[r].cells.enumerated().filter { (k, v) in v.selected }.map { (k, v) in k }
            
            rows[r].cells.remove(atOffsets: IndexSet(offsets))
        }
        
        // Remove empty rows
        removeEmptyRows()
    }
    
    // Get the row and cell indeces for the Cell
    func getCellIndex(cell: Cell) -> (Int, Int)? {
        for r in 0..<rows.count {
            for c in 0..<rows[r].cells.count {
                if rows[r].cells[c].id == cell.id {
                    return (r, c)
                }
            }
        }
        
        return nil
    }
    
    // If a Row has zero Cells, remove it from the rows array
    func removeEmptyRows() {
        let offsets: [Int] = rows.enumerated().filter { (k, v) in v.cells.isEmpty }.map { (k, v) in k }
        
        rows.remove(atOffsets: IndexSet(offsets))
    }
    
    func addRow(_ position: InsertionPosition) {
        let col = Cell(color: GridData.colors.first!)
        
        rows.insert(Row(cells: [col]), at: position.newIdx)
    }
    
    // Add a Cell at the beginning of end of a row
    func addCol(_ start: Bool) {
        for r in 0..<rows.count {
            let newColor = color(row: rows[r], start ? .before(0) : .after(rows[r].cells.count - 1))
            
            if start {
                rows[r].cells.insert(Cell(color: newColor), at: 0)
            } else {
                rows[r].cells.insert(Cell(color: newColor), at: rows[r].cells.count)
            }
        }
    }

    // Inserts a Cell on a Row, at the given position
    func addCell(rowIdx: Int, _ position: InsertionPosition) {
        let newColor = color(row: rows[rowIdx], position)

        rows[rowIdx].cells.insert(Cell(color: newColor), at: position.newIdx)
    }

    // Gets the color of a cell of a given row
    func color(row: Row, _ position: InsertionPosition) -> Color {
        
        let currentColor = row.cells[position.idx].color
        let currentColorIdx = GridData.colors.firstIndex(of: currentColor)!
        
        let newColorIdx: Int
        
        switch position {
        case .before:
            newColorIdx = (currentColorIdx == 0 ? GridData.colors.count - 1 : currentColorIdx - 1)
        case .after:
            newColorIdx = currentColorIdx + 1
        }
        
        return GridData.colors[newColorIdx % GridData.colors.count]
    }
}

// An hashable and iterable enum with Alignment values
enum AlignmentOption: String, Hashable, CaseIterable {
    case unspecified = "Unspecified"
    case topLeading = "topLeading"
    case top = "top"
    case topTrailing = "topTrailing"
    case leading = "leading"
    case center = "center"
    case trailing = "trailing"
    case bottomLeading = "bottomLeading"
    case bottom = "bottom"
    case bottomTrailing = "bottomTrailing"
    
    var alignment: Alignment {
        switch self {
        case .topLeading:
            return .topLeading
        case .top:
            return .top
        case .topTrailing:
            return .topTrailing
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        case .bottomLeading:
            return .bottomLeading
        case .bottom:
            return .bottom
        case .bottomTrailing:
            return .bottomTrailing
        case .unspecified:
            return .center
        }
    }
    
    var unitPoint: UnitPoint {
        switch self {
        case .topLeading:
            return .topLeading
        case .top:
            return .top
        case .topTrailing:
            return .topTrailing
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        case .bottomLeading:
            return .bottomLeading
        case .bottom:
            return .bottom
        case .bottomTrailing:
            return .bottomTrailing
        case .unspecified:
            return .center
        }
    }
    
    var shortName: String {
        switch self {
        case .unspecified: return "(?)"
        case .topLeading: return "(LT)"
        case .top: return "(Top)"
        case .topTrailing: return "(TT)"
        case .leading: return "(L)"
        case .center: return "(C)"
        case .trailing: return "(Tr)"
        case .bottomLeading: return "(BL)"
        case .bottom: return "(B)"
        case .bottomTrailing: return "(BT)"
        }
    }
    
    func mergeWithVerticalAlignment(_ verticalAlignment: VerticalAlignmentOption) -> AlignmentOption {
        if self == .leading || self == .topLeading || self == .bottomLeading {
            switch verticalAlignment {
            case .unspecified: return self
            case .top: return .topLeading
            case .bottom: return .bottomLeading
            case .center: return .leading
            }
        } else if self == .trailing || self == .topTrailing || self == .bottomTrailing {
            switch verticalAlignment {
            case .unspecified: return self
            case .top: return .topTrailing
            case .bottom: return .bottomTrailing
            case .center: return .trailing
            }
        } else {
            switch verticalAlignment {
            case .unspecified: return self
            case .top: return .top
            case .bottom: return .bottom
            case .center: return .center
            }
        }
    }
}

// An hashable and iterable enum with VerticalAlignment values
enum VerticalAlignmentOption: String, Hashable, CaseIterable {
    case unspecified = "Unspecified"
    case top = "top"
    case center = "center"
    case bottom = "bottom"
    
    var alignment: VerticalAlignment? {
        switch self {
        case .top:
            return .top
        case .center:
            return .center
        case .bottom:
            return .bottom
        case .unspecified:
            return nil
        }
    }
}

// An hashable and iterable enum with VerticalAlignment values
enum HorizontalAlignmentOption: String, Hashable, CaseIterable {
    case unspecified = "Unspecified"
    case leading = "leading"
    case center = "center"
    case trailing = "trailing"
    
    var alignment: HorizontalAlignment? {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        case .unspecified:
            return nil
        }
    }
}

// An enum with flex options
enum FlexOption: String, CaseIterable, Hashable {
    case fixed = "fixed size"
    case horizontal = "flexible width"
    case vertical = "flexible height"
    case both = "flexible width and height"
    
    var axisSet: Axis.Set {
        switch self {
        case .fixed: return []
        case .both: return [.horizontal, .vertical]
        case .horizontal: return .horizontal
        case .vertical: return .vertical
        }
    }
}

// An enum with unsize options
enum UnsizedOption: String, Hashable, CaseIterable {
    case unspecified = "unspecified"
    case horizontal = "horizontal"
    case vertical = "vertical"
    case both = "both"
    
    var axisSet: Axis.Set {
        switch self {
        case .unspecified: return []
        case .horizontal: return .horizontal
        case .vertical: return .vertical
        case .both: return [.horizontal, .vertical]
        }
    }
    
    func code(_ colors: CodeColors) -> AttributedString {
        switch self {
        case .unspecified: return AttributedString("")
        case .horizontal: return .dot(colors) + AttributedString("horizontal", colors.enum)
        case .vertical: return .dot(colors) + AttributedString("vertical", colors.enum)
        case .both:
            var txt = AttributedString.openSquare(colors)
            txt += .dot(colors) + AttributedString("horizontal", colors.enum)
            txt += .comma(colors)
            txt += .dot(colors) + AttributedString("vertical", colors.enum)
            txt += .closeSquare(colors)
            return txt
        }
    }

}

// An enum with select operations
enum SelectOperation {
    case select
    case deselect
    case toggle
    
    func change(_ value: Bool) -> Bool {
        switch self {
        case .select: return true
        case .deselect: return false
        case .toggle: return !value
        }
    }
}

// An enum used to specify the insertion position
enum InsertionPosition {
    case before(Int)
    case after(Int)
    
    var newIdx: Int {
        switch self {
        case .before(let idx):
            return idx
        case .after(let idx):
            return idx+1
        }
    }
    
    var idx: Int {
        switch self {
        case .before(let idx):
            return idx
        case .after(let idx):
            return idx
        }
    }
}

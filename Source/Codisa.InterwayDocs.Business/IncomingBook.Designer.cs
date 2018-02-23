using System;
using Codisa.InterwayDocs.Business.SearchObjects;
using Codisa.InterwayDocs.Rules;
using Csla;

namespace Codisa.InterwayDocs.Business
{

    /// <summary>
    /// IncomingBook (read only list).<br/>
    /// This is a generated base class of <see cref="IncomingBook"/> business object.
    /// This class is a root collection.
    /// </summary>
    /// <remarks>
    /// The items of the collection are <see cref="IncomingInfo"/> objects.
    /// </remarks>
    [Serializable]
    public partial class IncomingBook : ReadOnlyBindingListBase<IncomingBook, IncomingInfo>
    {

        #region Collection Business Methods

        /// <summary>
        /// Determines whether a <see cref="IncomingInfo"/> item is in the collection.
        /// </summary>
        /// <param name="registerId">The RegisterId of the item to search for.</param>
        /// <returns><c>true</c> if the IncomingInfo is a collection item; otherwise, <c>false</c>.</returns>
        public bool Contains(int registerId)
        {
            foreach (var incomingInfo in this)
            {
                if (incomingInfo.RegisterId == registerId)
                {
                    return true;
                }
            }
            return false;
        }

        #endregion

        #region Factory Methods

        /// <summary>
        /// Factory method. Loads a <see cref="IncomingBook"/> collection, based on given parameters.
        /// </summary>
        /// <param name="crit">The fetch criteria.</param>
        /// <returns>A reference to the fetched <see cref="IncomingBook"/> collection.</returns>
        public static IncomingBook GetIncomingBook(IncomingBookCriteriaGet crit)
        {
            return DataPortal.Fetch<IncomingBook>(crit);
        }

        #endregion

        #region Constructor

        /// <summary>
        /// Initializes a new instance of the <see cref="IncomingBook"/> class.
        /// </summary>
        /// <remarks> Do not use to create a Csla object. Use factory methods instead.</remarks>
        [System.ComponentModel.EditorBrowsable(System.ComponentModel.EditorBrowsableState.Never)]
        public IncomingBook()
        {
            // Use factory methods and do not use direct creation.

            var rlce = RaiseListChangedEvents;
            RaiseListChangedEvents = false;
            AllowNew = false;
            AllowEdit = false;
            AllowRemove = false;
            RaiseListChangedEvents = rlce;
        }

        #endregion

    }

    #region Criteria

    /// <summary>
    /// IncomingBookCriteriaGet criteria.
    /// </summary>
    [Serializable]
    public partial class IncomingBookCriteriaGet : SearchLocatableCriteriaBase<IncomingBookCriteriaGet>, IHaveArchiveLocation, IGenericCriteriaInformation
    {

        #region Constructors

        /// <summary>
        /// Initializes a new instance of the <see cref="IncomingBookCriteriaGet"/> class.
        /// </summary>
        /// <remarks> A parameterless constructor is required by the MobileFormatter.</remarks>
        [System.ComponentModel.EditorBrowsable(System.ComponentModel.EditorBrowsableState.Never)]
        public IncomingBookCriteriaGet()
        {
            var dateTypeList = CriteriaDateTypeList.GetCriteriaDateTypeList(false);
            LoadProperty(DateTypeListProperty, dateTypeList);
            LoadProperty(SelectedDateTypeIndexProperty, 0);
        }

        #endregion

    }

    #endregion

}
